import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginModel {
  final Logger log;
  final LoginRepository loginRepository;
  final AppService appService;

  late String currentVersion;
  bool obscureNewPassword = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel({
    required this.log,
    required this.loginRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      currentVersion = packageInfo.version;
      return true;
    } catch (e) {
      log.e('System Error', error: e);
      throw CustomException(e.toString());
    }
  }

  Future<void> login() async {
    try {
      final String username = usernameController.text;
      final String password = passwordController.text;

      final login = await loginRepository.login(
        username: username,
        password: password,
      );

      appService.preferencesRepo.setAccessToken(login.accessToken);
      appService.preferencesRepo.setRefreshToken(login.refreshToken);
      appService.preferencesRepo.setLoggedTooLong(login.loggedTooLong);
      appService.preferencesRepo.setPhoneNo(login.phoneNo);

      final profilesOfficer = await loginRepository.findProfilesOfficer();
      appService.preferencesRepo.setRoleName(profilesOfficer.roleName);
      appService.preferencesRepo.setOfficerId(profilesOfficer.id);
      appService.preferencesRepo.setRoleScopes(profilesOfficer.roleScopes);
      appService.login();
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


// for test otp
      // final loginForOtp = await loginRepository.loginForOtp(
      //   username: username,
      //   password: password,
      // );

      // String phone = "0656644696";
      // await loginRepository.findOtp(
      //   phone: phone,
      //   token: loginForOtp.reqAuthenToken,
      // );