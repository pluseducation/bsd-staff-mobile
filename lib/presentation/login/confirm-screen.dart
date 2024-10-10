import 'package:bst_staff_mobile/data/repository/register-repository.dart';
import 'package:bst_staff_mobile/domain/model/register.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/confirm-model.dart';
import 'package:bst_staff_mobile/presentation/login/create-accoount-screen.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ConfirmNumber extends StatefulWidget {
  final Register register;

  const ConfirmNumber({required this.register});

  @override
  _ConfirmNumberState createState() => _ConfirmNumberState();
}

class _ConfirmNumberState extends State<ConfirmNumber> {
  late ConfirmModel _model;

  @override
  void initState() {
    super.initState();
    _model = ConfirmModel(
      log: Provider.of<Logger>(super.context, listen: false),
      registerRepository:
          Provider.of<RegisterRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _model.register = widget.register;
    _model.startTimer();
  }

  @override
  void dispose() {
    _model.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ChangeNotifierProvider(
        create: (context) => _model,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                 
                  const Text(
                    'ยืนยันเบอร์โทรศัพท์',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'กรอกรหัส OTP 6 หลัก ที่ส่งไปยัง ${formatPhoneNumber(_model.register.phone)}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const Text(
                    'หากยังไม่ได้รับกรุณากดขอรหัสใหม่',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _ConfirmNumberForm(model: _model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfirmNumberForm extends StatefulWidget {
  final ConfirmModel model;

  const _ConfirmNumberForm({required this.model});

  @override
  State<_ConfirmNumberForm> createState() => _ConfirmNumberFormState();
}

class _ConfirmNumberFormState extends State<_ConfirmNumberForm> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            controller: _pinController,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            onCompleted: (pin) async {
              if (_formKey.currentState!.validate()) {
                await confirmOtpHandle(pin);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ไม่พบข้อมูล OTP  กรุณาตรวจสอบให้ถูกต้อง';
              } else if (value.length != 6) {
                return 'กรุณากรอกรหัส OTP ให้ครบ 6 หลัก';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Consumer<ConfirmModel>(
                builder: (context, model, child) {
                  return Text(
                    "ขอรหัสอีกครั้งได้อีกใน  ${model.start ~/ 60}:${(model.start % 60).toString().padLeft(2, '0')}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> confirmOtpHandle(String pin) async {
    try {
      widget.model.cancelTimer();
      await widget.model.confirmOtp(pin);
      gotoCreateAccountScreen();
    } on Exception catch (e) {
      _pinController.clear();
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  void gotoCreateAccountScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CreateAccountScreen(register: widget.model.register),
      ),
      (route) => false,
    );
  }
}
