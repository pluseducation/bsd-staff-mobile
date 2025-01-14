import 'dart:async';
import 'dart:io';

import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-provider.dart';
import 'package:bst_staff_mobile/presentation/profile/screen/notification-setting-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/layout/home-layout.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
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
  }

  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppbarProfile(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MainColors.primary500,
              Colors.white,
            ],
            stops: [-0.017, 1.2193],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(280 * (3.14159 / 50)),
          ),
          color: Colors.white12,
        ),
        child: Column(
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
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
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
                                                        BorderRadius.circular(
                                                            5),
                                                    color: MainColors.white,
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Icon(
                                                      Icons.person_pin,
                                                      color:
                                                          MainColors.primary500,
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
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF9CA3AF),
                                  ),
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
                                            const NotificationSettingScreen(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      // elevation: 0,
                                      // color: const Color(0xFFF6F6F6),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
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
                                                        BorderRadius.circular(
                                                            5),
                                                    color: MainColors.white,
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Icon(
                                                      Icons.notifications_none,
                                                      color:
                                                          MainColors.primary500,
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
                                      _model.logout();
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> personalInformation() async {
    try {
      final officerId = await _model.findOfficerId();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileParent(officerId: officerId),
        ),
      );
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
  late AppService appService;

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _profileFuture = _model.findProfile(widget.officerId);
    appService = Provider.of<AppService>(context, listen: false);
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
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: UploadImage(
                              profile.imageUrl,
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
                                style: TextStyle(
                                    fontSize: 17, color: MainColors.text),
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
                                style: TextStyle(
                                    fontSize: 17, color: MainColors.text),
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
                                style: TextStyle(
                                    fontSize: 17, color: MainColors.text),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // event
  Future<void> _onDelteUser() async {
    try {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('แจ้งเตือน'),
            content: const Text('คุณต้องการลบ บัญชีผู้ใช้ ?'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: MainColors.secondary, // Set the text color
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('ยกเลิก'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: MainColors.error, // Set the text color
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('ยืนยัน'),
              ),
            ],
          );
        },
      );

      if (confirmed == true) {
        // call deleted user
        await _model.deleteUser();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
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
  int officerId = 0;

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    initData();
  }

  Future<void> initData() async {
    officerId = await _model.findOfficerId();
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
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
        final profileUpdate = await _model.findProfileUpdate(
            officerId, password, confirmPassword);

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

class UploadImage extends StatefulWidget {
  final String imageUrl;
  const UploadImage(this.imageUrl);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  late ProfileModel _model;
  late int officerId = 0;
  late String imageUrl;

  Future<void> initData() async {
    officerId = await _model.findOfficerId();
  }

  @override
  void initState() {
    super.initState();
    _model = ProfileModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    imageUrl = widget.imageUrl;
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            radius: 50,
            backgroundImage: imageUrl.isNotEmpty
                ? NetworkImage(imageUrl)
                : imageUrl.isNotEmpty
                    ? NetworkImage(
                        imageUrl,
                      )
                    : null,
            child: imageUrl.isNotEmpty
                ? null
                : const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey,
                  ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _getFromGallery(context);
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Get from gallery
  Future<void> _getFromGallery(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        final updateImageUrl = await _model.updateProfileImage(imageFile);
        setState(() {
          imageUrl = updateImageUrl;
        });
      }
    } catch (e) {
      if (!context.mounted) return;
      final status = await Permission.photos.status;
      if (status.isDenied) {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Permission Denied'),
            content: const Text('Allow access to gallery and photos'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => openAppSettings(),
                child: const Text('Settings'),
              ),
            ],
          ),
        );
      } else {}
    }
  }
}
