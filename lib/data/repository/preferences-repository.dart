import 'package:flutter/material.dart';
import 'package:bst_staff_mobile/data/datasource/preferences.dart';

class PreferencesRepository {
  final Preferences preferences;

  PreferencesRepository({required this.preferences});

  Future<ThemeMode> getThemeMode() async {
    final rawValue = await preferences.getThemeMode();

    if (rawValue == ThemeMode.light.index) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await preferences.setThemeMode(mode.index);
  }

  Future<String?> getAccessToken() async {
    return preferences.getAccessToken();
  }

  Future<void> setAccessToken(String value) async {
    await preferences.setAccessToken(value);
  }

  Future<String?> getRefreshToken() async {
    return preferences.getRefreshToken();
  }

  Future<void> setRefreshToken(String value) async {
    await preferences.setRefreshToken(value);
  }

  Future<bool?> getLoggedTooLong() async {
    return preferences.getLoggedTooLong();
  }

  Future<void> setLoggedTooLong(bool value) async {
    await preferences.setLoggedTooLong(value);
  }

  Future<String?> getPhoneNo() async {
    return preferences.getPhoneNo();
  }

  Future<void> setPhoneNo(String value) async {
    await preferences.setPhoneNo(value);
  }
}
