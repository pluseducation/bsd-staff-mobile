import 'package:bst_staff_mobile/data/repository/register-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/register-model.dart';
import 'package:bst_staff_mobile/presentation/login/confirm-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.background,
      ),
      body: Form(
        key: _formKey,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ลงทะเบียน',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'ระบุเบอร์โทรศัพท์ผู้ป่วยหรือผู้ปกครอง',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  late RegisterModel _model;

  @override
  void initState() {
    super.initState();
    _model = RegisterModel(
      log: Provider.of<Logger>(super.context, listen: false),
      registerRepository:
          Provider.of<RegisterRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterModel(
        log: Provider.of<Logger>(context, listen: false),
        registerRepository:
            Provider.of<RegisterRepository>(context, listen: false),
        appService: Provider.of<AppService>(context, listen: false),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: const InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ไม่พบข้อมูลหมายเลขโทรศัพ~ท์ในระบบ กรุณาตรวจสอบ';
                } else if (value.length != 10) {
                  return 'กรุณากรอกเบอร์โทรศัพท์ให้ครบ';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    confirmOnClick(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColors.primary500,
                  padding: const EdgeInsets.all(13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'ดำเนินการต่อ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MainColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> confirmOnClick(BuildContext context) async {
    try {
      final phone = _phoneController.text;
      await _model.findRegister(phone);
      await _model.findOtp(phone);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmNumber(register: _model.register),
        ),
      );
    } on Exception catch (e) {
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
