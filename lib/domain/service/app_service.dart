import 'dart:async';

import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/main.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  final PreferencesRepository preferencesRepo;
  final LoginRepository loginRepository;
  late ThemeMode _themeMode;

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
  });

  Future<void> load() async {
    _themeMode = await preferencesRepo.getThemeMode();
    intervalWebAuth();
  }

  Future<void> logout() async {
    preferencesRepo.setAccessToken("");
    preferencesRepo.setRefreshToken("");
  }

  Future<void> intervalWebAuth() async {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      final token = await preferencesRepo.getAccessToken() ?? "";
      if (token.isNotEmpty) {
        try {
          final session = await loginRepository.findUserSession();
          if (session.status == "REQ_LOGIN") {
            timer.cancel();
            getIt<NavigationService>().navigateToReplacement('/auth');
          }
        } catch (e) {
          timer.cancel();
          getIt<NavigationService>().navigateToReplacement('/login');
        }
      }
    });
  }
}
