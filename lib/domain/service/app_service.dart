import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:flutter/material.dart';

class AppService extends ChangeNotifier {
  final PreferencesRepository preferencesRepo;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      notifyListeners();
      preferencesRepo.setThemeMode(value);
    }
  }

  AppService({required this.preferencesRepo});

  Future<void> load() async {
    _themeMode = await preferencesRepo.getThemeMode();
  }
}
