import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double toolbarHeight = 150;
const double toolbarHeightProfile = 70;

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

class BaseAppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  final String fullname;
  final String subdivisionName;

  const BaseAppBarProfile({
    super.key,
    required this.fullname,
    required this.subdivisionName,
  });

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeightProfile);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      title: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        fullname,
        style: const TextStyle(
          fontSize: FontSizes.large,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        subdivisionName,
        style: const TextStyle(
          fontSize: FontSizes.medium,
          color: Colors.white,
        ),
      ),
    ]);
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
