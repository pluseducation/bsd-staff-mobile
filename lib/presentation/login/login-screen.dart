import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/common/updater-screen.dart';
import 'package:bst_staff_mobile/presentation/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/login/login-model.dart';
import 'package:bst_staff_mobile/presentation/login/register-screen.dart';
import 'package:bst_staff_mobile/presentation/pin/login-withpin-screen.dart';
import 'package:bst_staff_mobile/presentation/pin/pin-screen.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UpdaterScreen(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo_1.png",
                            height: 100,
                          ),
                          Image.asset(
                            "assets/images/logo_2.png",
                            height: 100,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            fontSize: FontSizes.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "สำหรับเจ้าหน้าที่",
                          style: TextStyle(
                            fontSize: FontSizes.medium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const LoginContent(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent();

  @override
  State<LoginContent> createState() {
    return _LoginContentState();
  }
}

class _LoginContentState extends State<LoginContent> {
  final _formKey = GlobalKey<FormState>();
  late final LoginModel _model;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _model = LoginModel(
      log: Provider.of<Logger>(super.context, listen: false),
      loginRepository:
          Provider.of<LoginRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _model.initData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('ไม่พบข้อมูล'));
        } else {
          if (_model.isHavePin && !_hasNavigated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _hasNavigated = true;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginWithPinScreen(),
                ),
              );
            });
          }

          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _model.usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาระบุ Username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _model.passwordController,
                  obscureText: _model.obscureNewPassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Password",
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
                      return 'กรุณาระบุ Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_model.isHavePin) ...[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginWithPinScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'เข้าสู่ระบบด้วย pin',
                          style: TextStyle(
                            fontSize: 16,
                            color: MainColors.primary500,
                          ),
                        ),
                      ),
                    ] else ...[
                      const SizedBox(),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginOnClick();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.primary500),
                    child: const Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "App Version ${_model.currentVersion}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<void> loginOnClick() async {
    try {
      await _model.login();
      if (_model.isHavePin) {
        gotoHomeScreen();
        return;
      } else {
        gotoPinScreen("login");
      }
    } on Exception catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> registerOnClick() async {
    gotoRegisterScreen();
  }

  void gotoHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutScreen(),
      ),
      (route) => false,
    );
  }

  void gotoRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  void gotoPinScreen(String screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => PinScreen(screen: screen),
      ),
      (route) => false,
    );
  }
}
