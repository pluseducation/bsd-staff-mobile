import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double toolbarHeight = 150;
const double toolbarHeightHome = 60;

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(150.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_1.png",
                    width: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    "assets/images/logo3.png",
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ยินดีต้อนรับ เข้าสู่ระบบ",
                style: TextStyle(
                  fontSize: FontSizes.large,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "ระบบข้อมูลการบำบัดรักษาและฟื้นฟู",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  color: Colors.white,
                ),
              ),
              const Text(
                "ผู้ติดยาเสพติดของประเทศ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Image.asset(
          "assets/images/main_doctor.png",
          fit: BoxFit.cover,
          width: 130,
        ),
      ],
    );
  }
}

class BaseAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

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
            toolbarHeight: toolbarHeightHome,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo_1.png",
                          width: 50,
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          "assets/images/logo3.png",
                          width: 85,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
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
            width: 300,
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
            width: 180,
            height: 280,
            decoration: const BoxDecoration(
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
          ),
        ),
      ],
    );
  }
}

class BaseAppBarContent extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<int>? valueListenable;
  final String title;

  const BaseAppBarContent({
    super.key,
    this.valueListenable,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      title: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    if (valueListenable != null) {
      return ValueListenableBuilder<int>(
        valueListenable: valueListenable!,
        builder: (context, value, child) {
          return Text(
            "$title (${NumberFormat.decimalPattern().format(value)})",
            style: const TextStyle(
              fontSize: FontSizes.medium,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      );
    } else {
      return Text(
        title,
        style: const TextStyle(
          fontSize: FontSizes.medium,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}

class BaseAppBarBlank extends StatelessWidget implements PreferredSizeWidget {
  final int? count;
  final String title;

  const BaseAppBarBlank({
    super.key,
    this.count,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final formattedCount =
        count != null ? NumberFormat.decimalPattern().format(count) : null;
    return AppBar(
      toolbarHeight: kToolbarHeight,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        formattedCount != null ? "$title ($formattedCount)" : title,
        style: const TextStyle(
          fontSize: FontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
