import 'package:bst_staff_mobile/data/repository/patient-history-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PatientHistoryModel extends ChangeNotifier {
  final Logger log;
  final PatientHistoryRepository patientHistoryRepository;
  final AppService appService;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController cycleController = TextEditingController();

  late SearchPatientHistory search;
  late List<PatientHistory> historys;

  PatientHistoryModel({
    required this.log,
    required this.patientHistoryRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      search = initSearch();
      historys = [];
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

  SearchPatientHistory initSearch() {
    try {
      return SearchPatientHistory(
        type: "NAME",
        name: '',
        surname: '',
        nationalId: '',
        cycle: '',
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

  Future<void> searchByValue(String type) async {
    try {
      search = initSearch();
      search.type = type;

      if (search.type == "NAME") {
        search.name = nameController.text;
        search.surname = surnameController.text;
      } else if (search.type == "NATIONAL_ID") {
        search.nationalId = nationalIdController.text;
      } else if (search.type == "CYCLE") {
        search.cycle = cycleController.text;
      }

      historys = await patientHistoryRepository.findPatientHistory(
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
