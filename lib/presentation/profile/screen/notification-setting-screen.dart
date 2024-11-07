import 'package:bst_staff_mobile/data/repository/notification-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-provider.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  late NotificationProvider _model;

  @override
  void initState() {
    super.initState();
    _model = NotificationProvider(
      log: Provider.of<Logger>(super.context, listen: false),
      notificationRepository:
          Provider.of<NotificationRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    _model.findNotification();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationProvider>.value(
      value: _model,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: MainColors.background,
          title: const Text(
            "ตั้งค่าการแจ้งเตือน",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<bool>(
          future: _model.findNotification(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('ไม่พบข้อมูล'));
            } else {
              return Consumer<NotificationProvider>(
                builder: (context, model, child) {
                  final notification = model.notification;
                  return BaseLayoutScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSwitchRow(
                            "ตารางนัดหมาย",
                            notification.appointment,
                            (value) => model.updateAppointment(value),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                          _buildSwitchRow(
                            "การติดตาม",
                            notification.monitoring,
                            (value) => model.updateMonitoring(value),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                          _buildSwitchRow(
                            "เคสส่งต่อ/รอรับ",
                            notification.refer,
                            (value) => model.updateRefer(value),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                          _buildSwitchRow(
                            "ช่วยเหลือ",
                            notification.assistant,
                            (value) => model.updateAssistant(value),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                          _buildSwitchRow(
                            "เมื่อมีการ login web",
                            notification.login,
                            (value) => model.updateLogin(value),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSwitchRow(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
