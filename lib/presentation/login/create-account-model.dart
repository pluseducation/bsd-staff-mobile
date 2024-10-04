import 'dart:async';

import 'package:bst_staff_mobile/data/repository/register-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/register.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CreateAccountModel extends ChangeNotifier {
  final Logger log;
  final RegisterRepository registerRepository;
  final AppService appService;
  late Register register;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureNewPassword = true;

  CreateAccountModel({
    required this.log,
    required this.registerRepository,
    required this.appService,
  });

  Future<void> findRegister(String phone) async {
    try {
      register = await registerRepository.findRisterByPhone(phone);
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
      register.phone = phone;
      register = await registerRepository.findOtp(register: register);
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
        register.pin = pin;
        await registerRepository.confirmOtp(register: register);
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

  Future<void> confirmPassword(
    String password,
    String confirmPassword,
  ) async {
    try {
      if (password != confirmPassword) {
        throw CustomException('รหัสผ่านไม่ตรงกัน');
      } else {
        register.password = password;
        register.confirmPassword = confirmPassword;

        await registerRepository.confirmPassword(register);

        appService.preferencesRepo
            .setFullname('${register.name} ${register.surname}');
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
