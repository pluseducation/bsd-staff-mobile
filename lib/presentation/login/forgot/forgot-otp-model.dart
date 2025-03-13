import 'dart:async';

import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/forgot.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ForgotOtpModel extends ChangeNotifier {
  final Logger log;
  final ForgotRepository forgotRepository;
  final AppService appService;
  late Forgot forgot;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureNewPassword = true;

  Timer? _timer;
  int _start = 180;

  ForgotOtpModel({
    required this.log,
    required this.forgotRepository,
    required this.appService,
  });

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

  Future<void> confirmOtp(String pin) async {
    try {
      if (pin.length != 6) {
        throw CustomException('กรุณากรอกรหัส OTP ให้ครบ 6 หลัก');
      } else {
        forgot.pin = pin;
        await forgotRepository.confirmOtp(forgot: forgot);
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

  void startTimer() {
    _start = 180;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        _start--;
      } else {
        _timer?.cancel();
      }
      notifyListeners();
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  int get start => _start;
}
