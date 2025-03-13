import 'package:bst_staff_mobile/data/repository/refer-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/refer.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SenderModel extends ChangeNotifier {
  final Logger log;
  final ReferRepository referRepository;
  final AppService appService;

  bool isLoading = false;
  TextEditingController valueController = TextEditingController();

  late SearchSender search;
  late List<Sender> sender;
  late Debouncer debouncer;

  SenderModel({
    required this.log,
    required this.referRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      search = initSearch();
      sender = await referRepository.findSender(search: search);

      // debouncer
      debouncer = Debouncer(milliseconds: Constant.timeDebounce);

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

  SearchSender initSearch() {
    try {
      return SearchSender(
        searchVal: '',
        referStatus: [],
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
      sender = await referRepository.findSender(search: search);
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
      debouncer.run(() async {
        search = initSearch();
        search.searchVal = value;

        sender = await referRepository.findSender(search: search);
        notifyListeners();
      });
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

class ReceiverModel extends ChangeNotifier {
  final Logger log;
  final ReferRepository referRepository;
  final AppService appService;

  bool isLoading = false;
  TextEditingController valueController = TextEditingController();

  late ValueNotifier<int> dataNotifier;
  late SearchReceiver search;
  late List<Receiver> receiver;
  late Debouncer debouncer;

  ReceiverModel({
    required this.log,
    required this.referRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      receiver = await referRepository.findReceiver(search: search);

      this.dataNotifier.value = search.totalElements;
      // debouncer
      debouncer = Debouncer(milliseconds: Constant.timeDebounce);

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

  SearchReceiver initSearch() {
    try {
      return SearchReceiver(
        searchVal: '',
        referStatus: [],
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
      receiver = await referRepository.findReceiver(search: search);
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
      debouncer.run(() async {
        search = initSearch();
        search.searchVal = value;
        receiver = await referRepository.findReceiver(search: search);
        dataNotifier.value = search.totalElements;
        notifyListeners();
      });
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
