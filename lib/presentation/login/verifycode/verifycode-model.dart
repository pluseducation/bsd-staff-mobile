import 'dart:async';

import 'package:flutter/material.dart';

class VerifycodeModel {
  final int otpLength = 6;
  final int initialMinutes = 1;
  late Duration currentTimerValue;
  late Timer timer;
  late List<FocusNode> focusNodes;
  List<String> enteredDigits = [];

  bool validate() {
    for (final controller in otpControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  int pin = 6;
  late final List<TextEditingController> otpControllers = List.generate(
    pin,
    (index) => TextEditingController(),
  );

  VerifycodeModel() {
    currentTimerValue = Duration(minutes: initialMinutes);
    focusNodes = List.generate(
      otpLength,
      (index) => FocusNode(),
    );
  }

  bool get isButtonEnabled => currentTimerValue.inSeconds != 0;

  String getPin() {
    final otp = otpControllers.map((controller) => controller.text).join();
    return otp;
  }

  void dispost() {
    timer.cancel();
    for (final node in focusNodes) {
      node.dispose();
    }
  }
}
