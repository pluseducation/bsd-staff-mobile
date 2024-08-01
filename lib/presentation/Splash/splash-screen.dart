import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลัง
          Positioned.fill(
            child: Image.asset(
              "assets/images/bgpage.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: AnimatedSplashScreen(
              splash: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logobst.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ระบบข้อมูลการบำบัดและฟื้นฟูผู้ติดยาเสพติด",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              nextScreen: LoginScreen(),
              splashIconSize: 250,
              // splashTransition: SplashTransition.sizeTransition,
              duration: 3000,
            ),
          ),
        ],
      ),
    );
  }
}
