import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const keyThemeMode = 'theme_mode';
  static const keyAccessToken = 'accessToken';
  static const keyRefreshToken = 'refreshToken';
  static const keyLoggedTooLong = 'loggedTooLong';
  static const keyPhoneNo = 'phoneNo';
  static const keyRoleName = 'roleName';
  static const keyOfficerId = 'officerId';
  static const keyRoleScopes = 'RoleScopes';

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

  Future<String?> getRoleName() async {
    return prefs.getString(keyRoleName);
  }

  Future<void> setRoleName(String value) async {
    await prefs.setString(keyRoleName, value);
  }

  Future<int?> getOfficerId() async {
    return prefs.getInt(keyOfficerId);
  }

  Future<void> setOfficerId(int value) async {
    await prefs.setInt(keyOfficerId, value);
  }

  Future<List<String>> getRoleScopes() async {
    return prefs.get(keyRoleScopes) != null
        ? prefs.get(keyRoleScopes)! as List<String>
        : [];
  }

  Future<void> setRoleScopes(List<String> values) async {
    await prefs.setStringList(keyRoleScopes, values);
  }
}
