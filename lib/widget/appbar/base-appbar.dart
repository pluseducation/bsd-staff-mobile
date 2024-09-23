import 'package:bst_staff_mobile/presentation/patient/patient-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

const double toolbarHeight = 105;
const double toolbarHeightPatient = 80;

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
            width: 180,
            height: 280,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
                // topLeft: Radius.elliptical(70, 40),
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

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}

class BaseAppbarPatient extends StatefulWidget implements PreferredSizeWidget {
  final PaginationController paginationController;
  const BaseAppbarPatient({
    super.key,
    required this.paginationController,
  });

  @override
  _BaseAppbarPatientState createState() => _BaseAppbarPatientState();

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeightPatient);
}

class _BaseAppbarPatientState extends State<BaseAppbarPatient> {
  int totalItem = 0;

  @override
  void initState() {
    super.initState();

    widget.paginationController.totalItemStream.listen((value) {
      if (mounted) {
        setState(() {
          totalItem = value;
        });
      }
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ผู้ป่วย",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "($totalItem)",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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

class AppointmentAppbar extends StatefulWidget implements PreferredSizeWidget {
  const AppointmentAppbar({
    super.key,
  });

  @override
  _AppointmentAppbartState createState() => _AppointmentAppbartState();

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeightPatient);
}

class _AppointmentAppbartState extends State<AppointmentAppbar> {
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
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "นัดหมาย",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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

class BaseAppbarCertificate extends StatefulWidget
    implements PreferredSizeWidget {
  final int certificateCount;

  const BaseAppbarCertificate({
    super.key,
    required this.certificateCount,
  });

  @override
  _BaseAppbarCertificateState createState() => _BaseAppbarCertificateState();

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeightPatient);
}

class _BaseAppbarCertificateState extends State<BaseAppbarCertificate> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ใบรับรอง",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "(${widget.certificateCount}) รายการ",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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

// ---

class BaseAppbarProfile extends StatefulWidget implements PreferredSizeWidget {
  const BaseAppbarProfile({
    super.key,
  });

  @override
  _BaseAppbarProfileState createState() => _BaseAppbarProfileState();

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeightPatient);
}

class _BaseAppbarProfileState extends State<BaseAppbarProfile> {
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
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "ตั้งค่าโปรไฟล์",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "เปลี่ยนรหัสผ่าน, แจ้งเตือน",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
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
