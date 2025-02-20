import 'dart:async';
import 'dart:io';

import 'package:bst_staff_mobile/data/repository/config-repository.dart';
import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/domain/model/config-server.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  final PreferencesRepository preferencesRepo;
  final LoginRepository loginRepository;
  final ConfigRepository configRepository;
  late ThemeMode _themeMode;
  late ConfigServer config;

  bool appointment = false;
  bool patient = false;
  bool assistance = false;
  bool certificate = false;
  bool refer = false;
  bool dashboard = false;
  bool user = false;

  bool stat = false;
  bool history = false;

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
    initPermission();
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

  Future<void> initPermission() async {
    final roleName = await preferencesRepo.getRoleName() ?? "";
    final roleScopes = await preferencesRepo.getRoleScopes();
    if (roleName == "" && roleScopes.isEmpty) {
      // all false
      appointment = false;
      patient = false;
      assistance = false;
      certificate = false;
      refer = false;
      dashboard = false;
      user = false;

      stat = false;
      history = false;
    }

    if (roleScopes.contains("OTHER_APPOINTMENT")) {
      appointment = true;
    } else {
      appointment = false;
    }

    if (roleScopes.contains("FILLING_REGISTER") ||
        roleScopes.contains("FILLING_SCREENING") ||
        roleScopes.contains("FILLING_TREATMENT") ||
        roleScopes.contains("FILLING_MONITORING")) {
      patient = true;
    } else {
      patient = false;
    }

    if (roleScopes.contains("HELP_SENDER") ||
        roleScopes.contains("HELP_RECEIVER") ||
        roleScopes.contains("HELP_DATA_ALL") ||
        roleScopes.contains("HELP_DATA_PROVINCE") ||
        roleScopes.contains("HELP_DATA_DISTRICT") ||
        roleScopes.contains("HELP_DATA_SUB_DIVISION")) {
      assistance = true;
    } else {
      assistance = false;
    }

    if (roleScopes.contains("CERTIFICATE_REQUEST") ||
        roleScopes.contains("CERTIFICATE_OUT")) {
      certificate = true;
    } else {
      certificate = false;
    }

    if (roleScopes.contains("FILLING_REFER")) {
      refer = true;
    } else {
      refer = false;
    }

    dashboard = true;

    if (roleScopes.contains("ACCOUNT_ADD_ALL") ||
        roleScopes.contains("ACCOUNT_ADD_PROVINCE") ||
        roleScopes.contains("ACCOUNT_ADD_PROVINCE_DOC") ||
        roleScopes.contains("ACCOUNT_ADD_PROVINCE_DJOP") ||
        roleScopes.contains("ACCOUNT_ADD_PROVINCE_MINISTRY") ||
        roleScopes.contains("ACCOUNT_ADD_DISTRICT") ||
        roleScopes.contains("ACCOUNT_EDIT_ALL") ||
        roleScopes.contains("ACCOUNT_EDIT_PROVINCE") ||
        roleScopes.contains("ACCOUNT_EDIT_PROVINCE_DOC") ||
        roleScopes.contains("ACCOUNT_EDIT_PROVINCE_DJOP") ||
        roleScopes.contains("ACCOUNT_EDIT_PROVINCE_MINISTRY") ||
        roleScopes.contains("ACCOUNT_EDIT_DISTRICT") ||
        roleScopes.contains("ACCOUNT_CLOSE_ALL") ||
        roleScopes.contains("ACCOUNT_CLOSE_PROVINCE") ||
        roleScopes.contains("ACCOUNT_CLOSE_PROVINCE_DOC") ||
        roleScopes.contains("ACCOUNT_CLOSE_PROVINCE_DJOP") ||
        roleScopes.contains("ACCOUNT_CLOSE_PROVINCE_MINISTRY") ||
        roleScopes.contains("ACCOUNT_CLOSE_DISTRICT") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_ALL") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_PROVINCE") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_PROVINCE_DOC") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_PROVINCE_DJOP") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_PROVINCE_MINISTRY") ||
        roleScopes.contains("ACCOUNT_CHANGEPWD_DISTRICT")) {
      user = true;
    } else {
      user = false;
    }

    if (roleScopes.contains("OTHER_HISTORY_ALL") ||
        roleScopes.contains("OTHER_HISTORY_PROVINCE") ||
        roleScopes.contains("OTHER_HISTORY_PROVINCE_DOC") ||
        roleScopes.contains("OTHER_HISTORY_PROVINCE_DJOP") ||
        roleScopes.contains("OTHER_HISTORY_PROVINCE_MINISTRY") ||
        roleScopes.contains("OTHER_HISTORY_SUBDIVISION") ||
        roleScopes.contains("OTHER_HISTORY_DISTRICT")) {
      history = true;
    } else {
      history = false;
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
        roleName == "ONCB_CENTER" ||
        roleName == "ONCB" ||
        roleName == "ONCB_DISTRICT") {
      stat = true;
    } else {
      stat = false;
    }
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
