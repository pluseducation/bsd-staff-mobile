import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-change-password-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-info-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: const BaseAppBarBlank(
        title: 'ข้อมูลส่วนตัว',
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MainColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: const ProfileInfoContent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoContent extends StatefulWidget {
  const ProfileInfoContent({super.key});

  @override
  _ProfileInfoContentState createState() => _ProfileInfoContentState();
}

class _ProfileInfoContentState extends State<ProfileInfoContent> {
  late ProfileInfoModel _model;

  @override
  void initState() {
    super.initState();
    _model = ProfileInfoModel(
      log: Provider.of<Logger>(super.context, listen: false),
      profileRepository:
          Provider.of<ProfileRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileInfoModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<ProfileInfoModel>(
              builder: (context, model, child) {
                final offercer = model.officer;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: MainColors.divider,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: MainColors.text,
                                size: FontSizes.medium,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "หากต้องการแก้ไขข้อมูล กรุณาติดต่อ Admin",
                                style: TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "ชื่อ-สกุล",
                            style: TextStyle(
                              fontSize: FontSizes.medium,
                            ),
                          ),
                          Text(
                            offercer.fullname,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "เบอร์โทรศัพท์",
                            style: TextStyle(
                              fontSize: FontSizes.medium,
                            ),
                          ),
                          Text(
                            offercer.phoneNo,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "ชื่อบัญชีเข้าใช้งาน",
                            style: TextStyle(
                              fontSize: FontSizes.medium,
                            ),
                          ),
                          Text(
                            offercer.username,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileChangePasswordScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: MainColors.primary500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'เปลี่ยนรหัสผ่าน',
                                  style: TextStyle(
                                    fontSize: FontSizes.medium,
                                    fontWeight: FontWeight.bold,
                                    color: MainColors.primary500,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.lock,
                                  color: MainColors.primary500,
                                  size: FontSizes.medium,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
