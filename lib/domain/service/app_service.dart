import 'dart:async';
import 'dart:io';

import 'package:bst_staff_mobile/data/repository/config-repository.dart';
import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/domain/model/config-server.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/main.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  final PreferencesRepository preferencesRepo;
  final LoginRepository loginRepository;
  final ConfigRepository configRepository;
  late ThemeMode _themeMode;
  late bool _reportPermission = false;
  late String roleName = "";
  late ConfigServer config;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      notifyListeners();
      preferencesRepo.setThemeMode(value);
    }
  }

  AppService({
    required this.preferencesRepo,
    required this.loginRepository,
    required this.configRepository,
  });

  Future<void> load() async {
    _themeMode = await preferencesRepo.getThemeMode();
    config = await configRepository.loadConfig();
  }

  Future<void> logout() async {
    preferencesRepo.setAccessToken("");
    preferencesRepo.setRefreshToken("");
  }

  Future<void> login() async {
    intervalWebAuth();
  }

  Future<void> intervalWebAuth() async {
    // Timer.periodic(const Duration(seconds: 5), (timer) async {
    //   final token = await preferencesRepo.getAccessToken() ?? "";
    //   if (token.isNotEmpty) {
    //     try {
    //       final session = await loginRepository.findUserSession();
    //       if (session.status == "REQ_LOGIN") {
    //         timer.cancel();
    //         getIt<NavigationService>().navigateToReplacement('/auth');
    //       }
    //     } catch (e) {
    //       timer.cancel();
    //       getIt<NavigationService>().navigateToReplacement('/login');
    //     }
    //   } else {
    //     timer.cancel();
    //   }
    // });
  }

  Future<bool> loadPermission() async {
    roleName = await preferencesRepo.getRoleName() ?? "";
    if (roleName == "") {
      // all false
      _reportPermission = false;
      return true;
    }

    if (roleName == "SUPER_ADMIN" ||
        roleName == "ADMIN_CENTER" ||
        roleName == "ADMIN_PRISON" ||
        roleName == "ADMIN_DJOP" ||
        roleName == "ADMIN_HOSPITAL" ||
        roleName == "ADMIN_PROVINCE" ||
        roleName == "ADMIN_PPHO" ||
        roleName == "ADMIN_DISTRICT" ||
        roleName == "ADMIN_DPHO" ||
        roleName == "ADMIN_NCMC" ||
        roleName == "ONCB" ||
        roleName == "ONCB_DISTRICT") {
      _reportPermission = true;
    } else {
      _reportPermission = false;
    }

    return true;
  }

  bool getReportPermission() {
    return _reportPermission;
  }

  bool isDeploy() {
    if (Platform.isIOS) {
      return config.iosIsDeploy == "Y";
    } else if (Platform.isAndroid) {
      return config.androidIsDeploy == "Y";
    } else {
      return false;
    }
  }
}
