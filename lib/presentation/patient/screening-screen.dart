import 'package:flutter/material.dart';

class ScreeningScreen extends StatefulWidget {
  const ScreeningScreen({super.key});

  @override
  State<ScreeningScreen> createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("ScreeningScreen"),
      ],
    );
  }
}
