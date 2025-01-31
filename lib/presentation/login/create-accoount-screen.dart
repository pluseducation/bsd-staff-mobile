import 'package:bst_staff_mobile/data/repository/register-repository.dart';
import 'package:bst_staff_mobile/domain/model/register.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/home/home-screen.dart';
import 'package:bst_staff_mobile/presentation/login/create-account-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
  final Register register;

  const CreateAccountScreen({required this.register});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CreateAccounForm(register: register),
            // _CreateAccounForm(),
          ],
        ),
      ),
    );
  }
}

class _CreateAccounForm extends StatefulWidget {
  final Register register;
  const _CreateAccounForm({required this.register});

  @override
  State<_CreateAccounForm> createState() => _CreateAccounFormState();
}

class _CreateAccounFormState extends State<_CreateAccounForm> {
  late CreateAccountModel _model;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = CreateAccountModel(
      log: Provider.of<Logger>(super.context, listen: false),
      registerRepository:
          Provider.of<RegisterRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _model.register = widget.register;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
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
                  'สร้างบัญชีสำหรับเข้าใช้งาน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.large,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  initialValue: _model.register.username,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อบัญชีสำหรับเข้าใช้งาน',
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
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
                    labelStyle: const TextStyle(color: MainColors.text),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาระบุ ยืนยันรหัสผ่าน';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                const Text(
                  'ข้อมูลส่วนตัว',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.large,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _model.register.name,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อ',
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _model.register.surname,
                  decoration: const InputDecoration(
                    labelText: 'นามสกุล',
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _model.register.phone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'เบอร์โทรศัพท์',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'ยืนยันแล้ว',
                            style: TextStyle(
                              color: MainColors.primary500,
                              fontSize: FontSizes.medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _model.register.nationalId,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(13),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'เลขบัตรประชาชน',
                  ),
                  readOnly: true,
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
                        fontSize: FontSizes.medium,
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
      gotoRegistersuccessfullyScreen();
    } on Exception catch (e) {
      if (!context.mounted) return;
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  void gotoRegistersuccessfullyScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (route) => false,
    );
  }
}
