import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/forgot/forgot-model.dart';
import 'package:bst_staff_mobile/presentation/login/forgot/forgot-otp-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.background,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ลืมรหัสผ่าน',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'ระบุเบอร์โทรศัพท์ที่ลงทะเบียนไว้',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            ForgotContent(),
          ],
        ),
      ),
    );
  }
}

class ForgotContent extends StatefulWidget {
  const ForgotContent();

  @override
  State<ForgotContent> createState() => _ForgotContentState();
}

class _ForgotContentState extends State<ForgotContent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  late ForgotModel _model;

  @override
  void initState() {
    super.initState();
    _model = ForgotModel(
      log: Provider.of<Logger>(super.context, listen: false),
      forgotRepository:
          Provider.of<ForgotRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
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
                  return 'ไม่พบข้อมูลหมายเลขโทรศัพท์ในระบบ';
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
                    fontSize: 16,
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
      await _model.findForgot(phone);
      await _model.findOtp(phone);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotOtpScreen(forgot: _model.forgot),
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
