import 'dart:async';
import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileModel _model;

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    loadProfile();
  }

  Future<void> loadProfile() async {
    final findOfficerId = await _model.findOfficerId();
    print("findOfficerId ===>>> $findOfficerId");
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: MainColors.primary500,
        title: const Text(
          "สุนิสา ใจดี (ผู้ปกครอง)",
          style: TextStyle(
            fontSize: 18,
            color: MainColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: BaseLayout(
                maxWidth: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await personalInformation();
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              // elevation: 0,
                              child: BaseLayoutPadding(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: MainColors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: MainColors.white,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.person_pin,
                                              color: MainColors.primary500,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "ข้อมูลส่วนตัว",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF9CA3AF),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "การตั้งค่า",
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF9CA3AF)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationSetting(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              // elevation: 0,
                              // color: const Color(0xFFF6F6F6),
                              child: BaseLayoutPadding(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: MainColors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: MainColors.white,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.notifications_none,
                                              color: MainColors.primary500,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "แจ้งเตือน",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF9CA3AF),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFFBDBDBD),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'ออกจากระบบ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> personalInformation() async {
    try {
      final officerId = await _model.findOfficerId();

      if (officerId != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileParent(officerId: officerId),
          ),
        );
      } else {
        throw Exception('Officer ID not found');
        // Officer ID not found
      }
    } on Exception catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}

class ProfileParent extends StatefulWidget {
  final int officerId;

  const ProfileParent({super.key, required this.officerId});

  @override
  _ProfileParentState createState() => _ProfileParentState();
}

class _ProfileParentState extends State<ProfileParent> {
  late ProfileModel _model;
  late Future<Profile> _profileFuture;

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    // _profileFuture = _model.findProfile(9);
    _profileFuture = _model.findProfile(widget.officerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MainColors.background,
        title: const Text(
          "ข้อมูลส่วนตัว",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Profile>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่มีข้อมูลส่วนตัว'));
          } else {
            final profile = snapshot.data!;
            return BaseLayoutScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 0,
                        color: const Color(0xFFF6F6F6),
                        child: BaseLayoutPadding(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: MainColors.text,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'หากต้องการแก้ไขข้อมูล กรุณาติดต่อโทร ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: MainColors.text,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '02-222-2222',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: MainColors.text,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ชื่อ-สกุล",
                          style:
                              TextStyle(fontSize: 17, color: MainColors.text),
                        ),
                        Text(
                          profile.fullname,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "เบอร์โทรศัพท์",
                          style:
                              TextStyle(fontSize: 17, color: MainColors.text),
                        ),
                        Text(
                          profile.phoneNo,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ชื่อบัญชีเข้าใช้งาน",
                          style:
                              TextStyle(fontSize: 17, color: MainColors.text),
                        ),
                        Text(
                          profile.username,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileChangePassword(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: MainColors.primary500,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'เปลี่ยนรหัสผ่าน',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MainColors.primary500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.lock_outline,
                              color: MainColors.primary500,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ProfileChangePassword extends StatefulWidget {
  @override
  _ProfileChangePasswordState createState() => _ProfileChangePasswordState();
}

class _ProfileChangePasswordState extends State<ProfileChangePassword> {
  late ProfileModel _model;
  final _formKey = GlobalKey<FormState>();
  // final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  void dispose() {
    _model.passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MainColors.background,
        title: const Text(
          "เปลี่ยนรหัสผ่าน",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: BaseLayout(
          maxWidth: 600,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'ตั้งรหัสผ่านใหม่',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _model.passwordController,
                  obscureText: _model.obscureNewPassword,
                  decoration: InputDecoration(
                    hintText: "รหัสผ่านใหม่",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _model.obscureNewPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _model.obscureNewPassword =
                              !_model.obscureNewPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาระบุรหัสผ่าน';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _model.obscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "ยืนยันรหัสผ่านใหม่",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _model.obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _model.obscureConfirmPassword =
                              !_model.obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณายืนยันรหัสผ่าน';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await newPasswordOnClick();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainColors.primary500,
                    ),
                    child: const Text(
                      'ยืนยัน',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> newPasswordOnClick() async {
    try {
      final password = _model.passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (password.isNotEmpty && confirmPassword.isNotEmpty) {
        final profileUpdate =
            await _model.findProfileUpdate(password, confirmPassword);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        showInfoDialog(
          context: context,
          message: "กรุณาระบุรหัสผ่านและยืนยันรหัสผ่าน",
        );
      }
    } on Exception catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool light = false;
  bool tracking = true;
  bool forward = true;
  bool help = true;
  bool onlogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MainColors.background,
        title: const Text(
          "ตั้งค่าการแจ้งเตือน",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      // BaseLayoutScrollViewNotification
      // BaseLayoutScrollView
      body: BaseLayoutScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ตารางนัดหมาย",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: light,
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E4),
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "การติดตาม",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: tracking,
                          onChanged: (bool value) {
                            setState(() {
                              tracking = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E4),
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "เคสส่งต่อ/รอรับ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: forward,
                          onChanged: (bool value) {
                            setState(() {
                              forward = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E4),
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ช่วยเหลือ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: help,
                          onChanged: (bool value) {
                            setState(() {
                              help = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E4),
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "เมื่อมีการ login web",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: onlogin,
                          onChanged: (bool value) {
                            setState(() {
                              onlogin = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFDEE2E4),
                    thickness: 0.8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
