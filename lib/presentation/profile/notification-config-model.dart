import 'package:bst_staff_mobile/data/repository/notification-config-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/notification.dart' as noti;
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NotificationConfigModel extends ChangeNotifier {
  final Logger log;
  final NotificationConfigRepository notificationRepository;
  final AppService appService;
  late noti.Notification notification;

  NotificationConfigModel({
    required this.log,
    required this.notificationRepository,
    required this.appService,
  });

  Future<bool> findNotification() async {
    try {
      notification = await notificationRepository.findNotification();
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

  Future<void> updateAppointment(bool value) async {
    try {
      notification.appointment = value;
      await notificationRepository.updateNotification(notification);
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

  Future<void> updateMonitoring(bool value) async {
    try {
      notification.monitoring = value;
      await notificationRepository.updateNotification(notification);
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

  Future<void> updateRefer(bool value) async {
    try {
      notification.refer = value;
      await notificationRepository.updateNotification(notification);
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

  Future<void> updateAssistant(bool value) async {
    try {
      notification.assistant = value;
      await notificationRepository.updateNotification(notification);
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

  Future<void> updateLogin(bool value) async {
    try {
      notification.login = value;
      await notificationRepository.updateNotification(notification);
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
