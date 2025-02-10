import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class BaseBackground extends StatelessWidget {
  // add parameter child widget
  final Widget child;
  const BaseBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MainColors.primary500, MainColors.primary500],
              stops: [-0.017, 1.2193],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const IgnorePointer(
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1449, 0.9606],
                      colors: [
                        MainColors.primary500,
                        Colors.white,
                      ],
                      transform: GradientRotation(300.72 * (3.14159 / 180)),
                    ),
                    color: Colors.white12,
                  ),
                  child: SizedBox(width: 300, height: 400),
                ),
              ),
              Positioned(
                top: 60,
                right: -20,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(60),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      stops: [0.1449, 0.9606],
                      colors: [
                        MainColors.primary500,
                        Colors.white,
                      ],
                      transform: GradientRotation(280 * (3.14159 / 50)),
                    ),
                    color: Colors.white12,
                  ),
                  child: SizedBox(width: 180, height: 280),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: child,
        ),
      ],
    );
  }
}
