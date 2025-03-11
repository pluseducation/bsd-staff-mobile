import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithPinModel extends ChangeNotifier {
  final Logger log;
  final LoginRepository loginRepository;
  final AppService appService;

  String title = "ใส่รหัส PIN";
  bool isError = false;
  String pin = "";

  LoginWithPinModel({
    required this.log,
    required this.loginRepository,
    required this.appService,
  });

  Future<bool> setPin(String value, String type) async {
    try {
      if (isError == true) {
        isError = false;
        title = "ใส่รหัส PIN";
      }

      if (pin.length <= 6) {
        if (type == "ADD") {
          pin += value;
        } else {
          if (pin.isNotEmpty) {
            pin = pin.substring(0, pin.length - 1);
          }
        }
      }

      if (pin.length == 6) {
        notifyListeners();
        return true;
      }
      notifyListeners();
      return false;
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

  Future<void> login() async {
    try {
      final login = await loginRepository.loginWithPin(pin);
      appService.preferencesRepo.setAccessToken(login.accessToken);
      appService.preferencesRepo.setRefreshToken(login.refreshToken);
      appService.preferencesRepo.setLoggedTooLong(login.loggedTooLong);
      appService.preferencesRepo.setPhoneNo(login.phoneNo);

      final profilesOfficer = await loginRepository.findProfilesOfficer();
      appService.preferencesRepo.setRoleName(profilesOfficer.roleName);
      appService.preferencesRepo.setOfficerId(profilesOfficer.id);
      appService.preferencesRepo.setRoleScopes(profilesOfficer.roleScopes);

      final String? fcmToken = await _getFcmToken();
      if (fcmToken != null) {
        await loginRepository.updateFCMToken(
          login.accessToken,
          fcmToken,
        );
      }

      appService.login();
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    } finally {
      pin = "";
      notifyListeners();
    }
  }

  Future<String?> _getFcmToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }
}
