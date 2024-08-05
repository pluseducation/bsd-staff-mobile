import 'dart:async';

// import 'package:berante/presentation/login/createuser/create-user-model.dart';
// import 'package:berante/presentation/login/forgotpassword/forgot-password-model.dart';
// import 'package:berante/presentation/login/verifycode/verifycode-model.dart';
// import 'package:berante/theme/main-colors.dart';
// import 'package:berante/widget/screen/dialog.dart';
import 'package:bst_staff_mobile/presentation/layout/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/login/verifycode/verifycode-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifycodeScreen extends StatefulWidget {
  const VerifycodeScreen({super.key});

  @override
  _VerifycodeScreenState createState() => _VerifycodeScreenState();
}

class _VerifycodeScreenState extends State<VerifycodeScreen> {
  late final VerifycodeModel _model;

  @override
  void initState() {
    super.initState();
    _model = VerifycodeModel();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BaseLayout(
        maxWidth: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "ระบุรหัสยืนยัน",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text(
                  "รหัสยืนยันได้ส่งไปหมายเลขโทรศัพท์",
                  style: TextStyle(fontSize: 15, color: MainColors.primary500),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "098-738-xxxx",
                  style: TextStyle(fontSize: 15, color: MainColors.primary500),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "แล้ว",
                  style: TextStyle(fontSize: 15, color: MainColors.primary500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _model.otpLength,
                (index) => Container(
                  height: 50,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    controller: _model.otpControllers[index],
                    focusNode: _model.focusNodes[index],
                    autofocus: true,
                    onChanged: (value) {
                      _onDigitEntered(value, index);
                      if (value.length == 1) {
                        if (index < _model.otpLength - 1) {
                          _model.focusNodes[index + 1].requestFocus();
                        } else {
                          _model.focusNodes[index].unfocus();
                        }
                      } else if (value.isEmpty && index > 0) {
                        _model.focusNodes[index - 1].requestFocus();
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_model.currentTimerValue.inSeconds == 0)
                  Row(
                    children: [
                      const Text(
                        "OTP หมดอายุแล้ว",
                        style: TextStyle(
                          fontSize: 15,
                          color: MainColors.primary500,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          _onResend();
                        },
                        child: const Text(
                          'ส่งอีกครั้ง',
                          style: TextStyle(
                            fontSize: 15,
                            color: MainColors.secondary,
                            decoration: TextDecoration.underline,
                            decorationColor: MainColors.secondaryLight,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_model.currentTimerValue.inSeconds != 0)
                  Text(
                    'Resend code in ${_model.currentTimerValue.inMinutes.toString().padLeft(2, '0')}:${(_model.currentTimerValue.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: MainColors.primary500,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _model.isButtonEnabled ? _onSubmit : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MainColors.primary500,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ตกลง',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _model.timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_model.currentTimerValue.inSeconds > 0) {
          _model.currentTimerValue -= const Duration(seconds: 1);
        } else {
          _model.timer.cancel();
          _model.enteredDigits.clear();
        }
      });
    });
  }

  void _onDigitEntered(String digit, int index) {
    if (index < _model.otpLength) {
      setState(() {
        _model.enteredDigits.add(digit);
        _model.otpControllers[index].text = digit;
      });
    }
  }

  Future<void> _onSubmit() async {
    if (!_model.validate()) {
      showInfoDialog(
        context: context,
        message: 'กรุณากรอก OTP ให้ครบทุกช่อง',
      );
      return;
    }
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        ),
      );

      //_model.getPin();
      // if (widget.createUserModel != null) {
      //   widget.createUserModel?.registerUserForStudent(pin: pin);
      //   // Navigator.pop(context);
      // } else if (widget.forgotPasswordModel != null) {
      //   widget.forgotPasswordModel?.updateForgotPassword(pin: pin);
      //   // Navigator.pop(context);
      // }
    } on Exception catch (e) {
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> _onResend() async {
    try {
      // if (widget.createUserModel != null) {
      //   await widget.createUserModel?.createOTP();
      // } else if (widget.forgotPasswordModel != null) {
      //   await widget.forgotPasswordModel?.createOTPForgotPassword();
      // }
      print("ทดสอบจากระบบ");
    } on Exception catch (e) {
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
