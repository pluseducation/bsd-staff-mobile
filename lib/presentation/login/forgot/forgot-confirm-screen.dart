import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/domain/model/forgot.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/forgot/forgot-confirm-model.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ForgotConfirmScreen extends StatelessWidget {
  final Forgot forgot;

  const ForgotConfirmScreen({required this.forgot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgotConfirmContent(forgot: forgot),
          ],
        ),
      ),
    );
  }
}

class ForgotConfirmContent extends StatefulWidget {
  final Forgot forgot;
  const ForgotConfirmContent({required this.forgot});

  @override
  State<ForgotConfirmContent> createState() => _ForgotConfirmContentState();
}

class _ForgotConfirmContentState extends State<ForgotConfirmContent> {
  late ForgotConfirmModel _model;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = ForgotConfirmModel(
      log: Provider.of<Logger>(super.context, listen: false),
      forgotRepository:
          Provider.of<ForgotRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _model.forgot = widget.forgot;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ยืนยันรหัสผ่านใหม่',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'รหัสผ่าน',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาระบุ รหัสผ่าน';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'ยืนยันรหัสผ่าน',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาระบุ ยืนยันรหัสผ่าน';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registersuccessfullyOnClick();
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
                      'ยืนยันข้อมูล',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registersuccessfullyOnClick() async {
    try {
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;
      await _model.confirmPassword(password, confirmPassword);
      gotoLoginScreen();
    } on Exception catch (e) {
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  void gotoLoginScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
  }
}
