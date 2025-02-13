import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AssistanceModel extends ChangeNotifier {
  final Logger log;
  final AssistanceRepository assistanceRepository;
  final AppService appService;

  bool isLoading = false;
  TextEditingController valueController = TextEditingController();

  late ValueNotifier<int> dataNotifier;
  late SearchAssistance search;
  late List<Assistance> assistance;
  late List<Assistance> assistancePending;
  late List<Assistance> assistanceInprogress;
  late List<Assistance> assistanceCompleted;

  AssistanceModel({
    required this.log,
    required this.assistanceRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      assistance = await assistanceRepository.findAssistanceAll(
        search: search,
      );

      assistancePending = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.pending,
          )
          .toList();

      assistanceInprogress = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.inprogress,
          )
          .toList();

      assistanceCompleted = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.completed,
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

  SearchAssistance initSearch() {
    try {
      return SearchAssistance(
        searchVal: '',
        assistanceStatus: [],
        page: 0,
        totalPages: 0,
        totalElements: 0,
        size: Constant.size,
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
      assistance = await assistanceRepository.findAssistanceAll(
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
      search.searchVal = value;

      assistance = await assistanceRepository.findAssistanceAll(
        search: search,
      );

      assistancePending = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.pending,
          )
          .toList();

      assistanceInprogress = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.inprogress,
          )
          .toList();

      assistanceCompleted = assistance
          .where(
            (item) => item.assistanceStatus == AssistanceStatus.completed,
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
}

class AssistanceDetailModel extends ChangeNotifier {
  final Logger log;
  final AssistanceRepository assistanceRepository;
  final AppService appService;

  late List<AssistanceDetail> assistanceDetail;

  AssistanceDetailModel({
    required this.log,
    required this.assistanceRepository,
    required this.appService,
  });

  Future<bool> initData(int assistanceRoundId) async {
    try {
      // this.
      assistanceDetail = await assistanceRepository.findAssistanceByRoundById(
        assistanceRoundId: assistanceRoundId,
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
}
