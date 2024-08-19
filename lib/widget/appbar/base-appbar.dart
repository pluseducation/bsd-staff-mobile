import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

const double toolbarHeight = 105;

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
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
          child: AppBar(
            toolbarHeight: toolbarHeight,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/snapedit.png",
                      width: 115,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Drug Treatment",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Network",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: MainColors.background,
                        ),
                        Positioned(
                          right: 24,
                          bottom: 0,
                          top: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                color: MainColors.secondaryDark,
                                size: 30,
                              ),
                              onPressed: () {
                                print("ทดสอบจากระบบ");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: -70,
          child: Container(
            width: 280,
            height: 400,
            decoration: const BoxDecoration(
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
          ),
        ),
        Positioned(
          top: 60,
          right: -20,
          child: Container(
            width: 170,
            height: 280,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.1449, 0.9606],
                colors: [
                  MainColors.primary500,
                  Colors.white,
                ],
                transform: GradientRotation(280 * (3.14159 / 45)),
              ),
              color: Colors.white12,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}
