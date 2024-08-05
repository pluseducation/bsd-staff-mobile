import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const keyThemeMode = 'theme_mode';
  static const keyAccessToken = 'accessToken';
  static const keyRefreshToken = 'refreshToken';
  static const keyLoggedTooLong = 'loggedTooLong';
  static const keyPhoneNo = 'phoneNo';

  final defThemeMode = ThemeMode.light.index;

  final SharedPreferences prefs;

  Preferences({required this.prefs});

  Future<int> getThemeMode() async {
    return prefs.getInt(keyThemeMode) ?? defThemeMode;
  }

  Future<void> setThemeMode(int value) async {
    await prefs.setInt(keyThemeMode, value);
  }

  Future<String?> getAccessToken() async {
    return prefs.getString(keyAccessToken);
  }

  Future<void> setAccessToken(String value) async {
    await prefs.setString(keyAccessToken, value);
  }

  Future<String?> getRefreshToken() async {
    return prefs.getString(keyRefreshToken);
  }

  Future<void> setRefreshToken(String value) async {
    await prefs.setString(keyRefreshToken, value);
  }

  Future<bool?> getLoggedTooLong() async {
    return prefs.getBool(keyLoggedTooLong);
  }

  Future<void> setLoggedTooLong(bool value) async {
    await prefs.setBool(keyLoggedTooLong, value);
  }

  Future<String?> getPhoneNo() async {
    return prefs.getString(keyPhoneNo);
  }

  Future<void> setPhoneNo(String value) async {
    await prefs.setString(keyPhoneNo, value);
  }
}