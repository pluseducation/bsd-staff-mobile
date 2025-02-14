import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-change-password-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: const BaseAppBarBlank(
        title: 'เปลี่ยนรหัสผ่าน',
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: const ProfileInfoContent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoContent extends StatefulWidget {
  const ProfileInfoContent({super.key});

  @override
  _ProfileInfoContentState createState() => _ProfileInfoContentState();
}

class _ProfileInfoContentState extends State<ProfileInfoContent> {
  final _formKey = GlobalKey<FormState>();
  late ProfileChangePasswordModel _model;

  @override
  void initState() {
    super.initState();
    _model = ProfileChangePasswordModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileChangePasswordModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<ProfileChangePasswordModel>(
              builder: (context, model, child) {
                final offercer = model.officer;
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'ตั้งรหัสผ่านใหม่',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: _model.passwordController,
                                  obscureText: _model.obscureNewPassword,
                                  decoration: InputDecoration(
                                    hintText: "รหัสผ่านใหม่",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _model.obscureNewPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _model.obscureNewPassword =
                                              !_model.obscureNewPassword;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณาระบุรหัสผ่าน';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: model.confirmPasswordController,
                                  obscureText: _model.obscureConfirmPassword,
                                  decoration: InputDecoration(
                                    hintText: "ยืนยันรหัสผ่านใหม่",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _model.obscureConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _model.obscureConfirmPassword =
                                              !_model.obscureConfirmPassword;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณายืนยันรหัสผ่าน';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await _onSubmit();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MainColors.primary500,
                                    ),
                                    child: const Text(
                                      'ยืนยัน',
                                      style: TextStyle(
                                        fontSize: 18,
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
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _onSubmit() async {
    try {
      final password = _model.passwordController.text;
      final confirmPassword = _model.confirmPasswordController.text;

      if (password.isNotEmpty && confirmPassword.isNotEmpty) {
        final profileUpdate = await _model.updateProfile(
          password,
          confirmPassword,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        showInfoDialog(
          context: context,
          message: "กรุณาระบุรหัสผ่านและยืนยันรหัสผ่าน",
        );
      }
    } on Exception catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
