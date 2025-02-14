import 'dart:io';

import 'package:bst_staff_mobile/data/repository/notification-config-repository.dart';
import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/notification.dart' as noti;
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProfileModel {
  final Logger log;
  final ProfileRepository profileRepository;
  final AppService appService;

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  final passwordController = TextEditingController();

  ProfileModel({
    required this.log,
    required this.profileRepository,
    required this.appService,
  });

  Future<Profile> findProfile(int officerId) async {
    return profileRepository.findProfileByOfficerId(officerId);
  }

  Future<int> findOfficerId() async {
    final result = await appService.preferencesRepo.getOfficerId();
    return convertToInt(result);
  }

  Future<bool> findProfileUpdate(
    int officerId,
    String password,
    String confirmPassword,
  ) async {
    return profileRepository.updateProfile(
        officerId, password, confirmPassword);
  }

  Future<String> updateProfileImage(File image) async {
    try {
      final imageUrl = await profileRepository.updateProfileImage(image);
      return imageUrl;
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

  Future<void> logout() async {
    await appService.logout();
  }

  Future<bool> deleteUser() async {
    try {
      final result = await profileRepository.deleteUser();
      logout();

      return result;
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

// -----

class NotificationProvider extends ChangeNotifier {
  final Logger log;
  final NotificationConfigRepository notificationRepository;
  final AppService appService;
  late noti.Notification notification;

  NotificationProvider({
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
