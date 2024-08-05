import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/layout/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/login/login-model.dart';
import 'package:bst_staff_mobile/presentation/login/verifycode/verifycode-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BaseLayouts(
          maxWidth: 600,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/logobst_2.png",
                    width: 200,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: textTheme.headlineSmall,
                  ),
                ),
                const Center(
                  child: Text(
                    "สำหรับเจ้าหน้าที่",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF797979),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const _LoginForm(),
                // const SizedBox(height: 70),
                // Text('ยังไม่มีบัญชีใช้งาน', style: textTheme.titleMedium),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //             builder: (context) => const VerifycodeScreen(),
                //           ),
                //         );
                //       },
                //       child: const Text(
                //         'ลงทะเบียน',
                //         style: TextStyle(
                //           color: MainColors.primary500,
                //           decoration: TextDecoration.underline,
                //           decorationColor: MainColors.primary300,
                //           decorationThickness: 1,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final LoginModel _model;

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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     statusWidget("REGISTERING"),
          //     statusWidget("SCREENING"),
          //     statusWidget("TREATMENT"),
          //     statusWidget("MONITORING"),
          //     statusWidget("DISCHARGED"),
          //   ],
          // ),
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
          const SizedBox(height: 26),
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
                    _model.obscureNewPassword = !_model.obscureNewPassword;
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
          const SizedBox(height: 20),
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginOnClick() async {
    try {
      await _model.login();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const VerifycodeScreen(),
        ),
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const LayoutScreen(),
      //   ),
      // );
    } on Exception catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}