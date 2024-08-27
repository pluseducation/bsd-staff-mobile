import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/presentation/home/home-screen.dart';
import 'package:bst_staff_mobile/presentation/layout/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/login/auth/auth-model.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    final model = AuthModel(
      log: Provider.of<Logger>(context, listen: false),
      loginRepository: Provider.of<LoginRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    Future<void> handleAuth() async {
      try {
        await model.handleAuth();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } on Exception catch (e) {
        showInfoDialog(
          context: context,
          message: e.toString(),
        );
      }
    }

    Future<void> handleCancel() async {
      try {
        await model.handleCancel();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } on Exception catch (e) {
        showInfoDialog(
          context: context,
          message: e.toString(),
        );
      }
    }

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
              const SizedBox(height: 35),
              Text(
                'ยืนยันตัวตน 2 ระดับเพื่อเข้าใช้งานเว็บไซต์',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    handleAuth();
                  },
                  child: const Text("ยืนยันตัวตน"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: TextButton(
                  onPressed: () {
                    handleCancel();
                  },
                  child: const Text("ยกเลิก"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
