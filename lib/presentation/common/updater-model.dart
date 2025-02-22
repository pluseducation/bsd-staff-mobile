import 'dart:io';

import 'package:bst_staff_mobile/data/repository/config-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/config-server.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdaterModel extends ChangeNotifier {
  final Logger log;
  final AppService appService;
  final ConfigRepository configRepository;

  late UpdateApp updateApp;
  late PackageInfo packageInfo;
  late String currentVersion;
  late String aviableVersion;
  late String updateUrl;

  UpdaterModel({
    required this.log,
    required this.configRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      updateApp = await configRepository.findConfig();
      packageInfo = await PackageInfo.fromPlatform();

      currentVersion = packageInfo.version;
      aviableVersion =
          Platform.isIOS ? updateApp.iosVersion : updateApp.androidVersion;

      updateUrl =
          Platform.isIOS ? updateApp.iosUpdateUrl : updateApp.androidUpdateUrl;

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

  bool checkUpdate() {
    try {
      final currentVersion = packageInfo.version;
      final iosVersion = updateApp.iosVersion;
      final androidVersion = updateApp.androidVersion;

      // check platform ios or android
      if (Platform.isIOS && updateApp.iosIsDeploy != "Y") {
        if (currentVersion != iosVersion) {
          return true;
        }
      } else if (Platform.isAndroid && updateApp.androidIsDeploy != "Y") {
        if (currentVersion != androidVersion) {
          return true;
        }
      }

      return false;
    } catch (e) {
      log.e('System Error', error: e);
      throw CustomException(e.toString());
    }
  }
}
