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

  bool isFilter = false;
  TextEditingController valueController = TextEditingController();

  late ValueNotifier<int> dataNotifier;
  late SearchPatient search;
  late List<Patient> patients;

  PatientModel({
    required this.log,
    required this.patientRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      patients = await patientRepository.findPatientAll(
        search: search,
      );
      this.dataNotifier.value = search.totalElements;
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

  SearchPatient initSearch() {
    try {
      return SearchPatient(
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

  Future<void> loadData(int page) async {
    try {
      search.page = page;
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

  Future<void> searchByValue(String value) async {
    try {
      search = initSearch();
      search.searchVal = value;

      patients = await patientRepository.findPatientAll(
        search: search,
      );

      dataNotifier.value = search.totalElements;
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

      if (workFlowStatus.isNotEmpty ||
          levelTypes.isNotEmpty ||
          drugEvalResults.isNotEmpty ||
          treatmentTypes.isNotEmpty ||
          smivTypes.isNotEmpty) {
        isFilter = true;
      } else {
        isFilter = false;
      }

      valueController.text = searchVal;
      patients = await patientRepository.findPatientAll(
        search: search,
      );

      dataNotifier.value = search.totalElements;
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
