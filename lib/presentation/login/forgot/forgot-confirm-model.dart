import 'dart:async';

import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/forgot.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ForgotConfirmModel extends ChangeNotifier {
  final Logger log;
  final ForgotRepository forgotRepository;
  final AppService appService;
  late Forgot forgot;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureNewPassword = true;

  ForgotConfirmModel({
    required this.log,
    required this.forgotRepository,
    required this.appService,
  });

  Future<void> confirmPassword(
    String password,
    String confirmPassword,
  ) async {
    try {
      if (password != confirmPassword) {
        throw CustomException('รหัสผ่านไม่ตรงกัน');
      } else {
        forgot.password = password;
        forgot.confirmPassword = confirmPassword;

        await forgotRepository.confirmPassword(forgot);
        await forgotRepository.deletePin();
        // clear pin
      }
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
