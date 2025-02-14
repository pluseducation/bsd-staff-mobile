import 'package:bst_staff_mobile/data/repository/notification-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/notification-app.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class NotificationModel extends ChangeNotifier {
  final Logger log;
  final NotificationRepository notificationRepository;
  final AppService appService;

  late ValueNotifier<int> dataNotifier;
  late SearchNotification search;
  late List<NotificationApp> notifications;
  bool isLoading = false;

  NotificationModel({
    required this.log,
    required this.notificationRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      notifications = await notificationRepository.findAll(search);

      final count =
          notifications.where((item) => item.acknowledged == false).length;

      this.dataNotifier.value = count;
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

  SearchNotification initSearch() {
    try {
      return SearchNotification(
        page: 0,
        size: Constant.size,
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
      final tmps = await notificationRepository.findAll(search);

      // check if id is't already in the list add to news.content
      if (tmps.isNotEmpty) {
        for (final tmp in tmps) {
          if (!notifications.any((element) => element.id == tmp.id)) {
            notifications.add(tmp);
          }
        }
      }

      final count =
          notifications.where((item) => item.acknowledged == false).length;

      dataNotifier.value = count;
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

  Future<void> updateAcknowledged(int id) async {
    try {
      await notificationRepository.updateAcknowledged(id);
      notifications.firstWhere((element) => element.id == id).acknowledged =
          true;

      final count =
          notifications.where((item) => item.acknowledged == false).length;
      dataNotifier.value = count;
      notifyListeners();
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
