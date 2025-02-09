import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PatientModel extends ChangeNotifier {
  final Logger log;
  final PatientRepository patientRepository;
  final AppService appService;

  bool isLoading = false;
  late Search search;
  late List<Patient> patients;

  PatientModel({
    required this.log,
    required this.patientRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      search = initSearch();
      patients = await patientRepository.findPatientAll(
        search: search,
      );

      return true;
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }

  Search initSearch() {
    try {
      return Search(
        page: 0,
        size: Constant.size,
        searchVal: '',
        workFlowStatus: [],
        levelTypes: [],
        drugEvalResults: [],
        treatmentTypes: [],
        smivTypes: [],
        totalPages: 0,
        totalElements: 0,
      );
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }

  bool isMoreData() {
    if (isLoading) return false;

    if (search.page + 1 < search.totalPages) {
      isLoading = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadData() async {
    try {
      search.page++;
      final tmps = await patientRepository.findPatientAll(
        search: search,
      );

      if (tmps.isNotEmpty) {
        for (final tmp in tmps) {
          if (!patients.any((item) => item.patientId == tmp.patientId)) {
            patients.add(tmp);
          }
        }
      }
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByValue(String value) async {
    try {
      search = initSearch();
      search.searchVal = value;

      patients = await patientRepository.findPatientAll(
        search: search,
      );
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    } finally {
      notifyListeners();
    }
  }

  Future<void> searchByStatus(
    String searchVal,
    List<WorkFlowStatus> workFlowStatus,
    List<LevelType> levelTypes,
    List<DrugEvalResult> drugEvalResults,
    List<TreatmentType> treatmentTypes,
    List<SmivType> smivTypes,
  ) async {
    try {
      search = initSearch();
      search.searchVal = searchVal;
      search.workFlowStatus = workFlowStatus;
      search.levelTypes = levelTypes;
      search.drugEvalResults = drugEvalResults;
      search.treatmentTypes = treatmentTypes;
      search.smivTypes = smivTypes;

      patients = await patientRepository.findPatientAll(
        search: search,
      );
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    } finally {
      notifyListeners();
    }
  }
}
