import 'package:bst_staff_mobile/data/repository/officer-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/officer.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class OfficerModel extends ChangeNotifier {
  final Logger log;
  final OfficerRepository officerRepository;
  final AppService appService;

  bool isLoading = false;
  TextEditingController valueController = TextEditingController();

  late ValueNotifier<int> dataNotifier;
  late SearchOfficer search;
  late List<Officer> officer;
  late List<Officer> officerActive;
  late List<Officer> officerInactive;

  OfficerModel({
    required this.log,
    required this.officerRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      officer = await officerRepository.findOfficer(
        search: search,
      );

      officerActive = officer
          .where(
            (item) => item.active == true,
          )
          .toList();

      officerInactive = officer
          .where(
            (item) => item.active == false,
          )
          .toList();

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

  SearchOfficer initSearch() {
    try {
      return SearchOfficer(
        page: 0,
        totalPages: 0,
        totalElements: 0,
        size: Constant.size,
        name: '',
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
      officer = await officerRepository.findOfficer(
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
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByValue(String value) async {
    try {
      search = initSearch();
      search.name = value;

      officer = await officerRepository.findOfficer(
        search: search,
      );

      officerActive = officer
          .where(
            (item) => item.active == true,
          )
          .toList();

      officerInactive = officer
          .where(
            (item) => item.active == false,
          )
          .toList();

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

  //updateOfficer

  Future<void> updateOfficer(int officerId, bool active) async {
    try {
      await officerRepository.updateOfficer(
        officerId: officerId,
        active: active,
      );

      officer = await officerRepository.findOfficer(
        search: search,
      );

      officerActive = officer
          .where(
            (item) => item.active == true,
          )
          .toList();

      officerInactive = officer
          .where(
            (item) => item.active == false,
          )
          .toList();
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
