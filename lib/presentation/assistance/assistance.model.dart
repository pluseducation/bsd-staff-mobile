import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AssistanceModel extends ChangeNotifier {
  final Logger log;
  final AssistanceRepository assistanceRepository;
  final AppService appService;

  bool isLoading = false;
  late SearchAssistance search;
  late List<Assistance> assistance;

  AssistanceModel({
    required this.log,
    required this.assistanceRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      search = initSearch();
      assistance = await assistanceRepository.findAssistanceAll(
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

  SearchAssistance initSearch() {
    try {
      return SearchAssistance(
        searchVal: '',
        workFlowStatus: [],
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
      final tmps = await assistanceRepository.findAssistanceAll(
        search: search,
      );

      if (tmps.isNotEmpty) {
        for (final tmp in tmps) {
          if (!assistance
              .any((item) => item.assistanceRoundId == tmp.assistanceRoundId)) {
            assistance.add(tmp);
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
      notifyListeners();
    }
  }
}
