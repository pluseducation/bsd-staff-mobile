import 'dart:async';

import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/forgot.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ForgotModel extends ChangeNotifier {
  final Logger log;
  final ForgotRepository forgotRepository;
  final AppService appService;
  late Forgot forgot;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureNewPassword = true;

  ForgotModel({
    required this.log,
    required this.forgotRepository,
    required this.appService,
  });

  Future<void> findForgot(String username) async {
    try {
      forgot = await forgotRepository.findForgot(username);
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

  Future<void> findOtp(String phone) async {
    try {
      forgot.phoneNo = phone;
      forgot = await forgotRepository.findOtp(forgot: forgot);
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
