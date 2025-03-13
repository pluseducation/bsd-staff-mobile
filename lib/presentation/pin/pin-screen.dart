import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/pin-repository.dart';
import 'package:bst_staff_mobile/domain/model/register.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/pin/pin-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatelessWidget {
  final String screen;
  final Register? register;
  const PinScreen({super.key, required this.screen, this.register});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar background color is transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: BaseBackgroundImage(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(16),
            child: PinContent(screen: screen, register: register),
          ),
        ),
      ),
    );
  }
}

class PinContent extends StatefulWidget {
  final String screen;
  final Register? register;
  const PinContent({super.key, required this.screen, required this.register});

  @override
  _PinContentState createState() => _PinContentState();
}

class _PinContentState extends State<PinContent> {
  final _formKey = GlobalKey<FormState>();
  late PinModel _model;

  @override
  void initState() {
    super.initState();
    _model = PinModel(
      log: Provider.of<Logger>(super.context, listen: false),
      pinRepository: Provider.of<PinRepository>(super.context, listen: false),
      loginRepository:
          Provider.of<LoginRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _model.setRegister(widget.register);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onKeyPressed(String value) async {
    if (_model.pin.length <= 6) {
      final isUpdate = await _model.setPin(value, "ADD");
      if (isUpdate) {
        if (widget.screen == "login") {
          gotoHomeScreen();
        } else if (widget.screen == "register") {
          gotoHomeScreen();
        } else {
          Navigator.pop(context);
        }
      }
    }
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

  Future<void> _onBackspacePressed() async {
    await _model.setPin("", "BACK");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PinModel>.value(
      value: _model,
      child: Consumer<PinModel>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo_1.png",
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        "assets/images/logo_2.png",
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (model.isError == false) ...[
                    Text(
                      model.title,
                      style: const TextStyle(fontSize: FontSizes.large),
                    ),
                  ] else ...[
                    Text(
                      model.title,
                      style: const TextStyle(
                        fontSize: FontSizes.large,
                        color: MainColors.error,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  _buildBullet(model.pin.length),
                  const SizedBox(height: 24),
                  _buildKeypad(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBullet(int pinLength) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Row(
          children: [
            Icon(
              index < pinLength ? Icons.circle : Icons.circle_outlined,
              color: index < pinLength
                  ? MainColors.primary500
                  : MainColors.secondary,
              size: 24,
            ),
            if (index < 5) const SizedBox(width: 8), // Add gap between icons
          ],
        );
      }),
    );
  }

  Widget _buildKeypad() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.7,
        mainAxisSpacing: 12, // Set the vertical gap between items
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) {
          return const SizedBox.shrink();
        } else if (index == 10) {
          return OutlinedButton(
            onPressed: () => _onKeyPressed('0'),
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(color: Colors.grey),
            ),
            child: const Text(
              '0',
              style: TextStyle(fontSize: 24, color: MainColors.secondaryDark),
            ),
          );
        } else if (index == 11) {
          return IconButton(
            icon: const Icon(Icons.backspace_outlined),
            iconSize: 50,
            onPressed: _onBackspacePressed,
            color: Colors.grey,
          );
        } else {
          final num = (index + 1).toString();
          return OutlinedButton(
            onPressed: () => _onKeyPressed(num),
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(color: Colors.grey),
            ),
            child: Text(
              num,
              style: const TextStyle(
                fontSize: 24,
                color: MainColors.secondaryDark,
              ),
            ),
          );
        }
      },
    );
  }
}
