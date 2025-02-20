import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/appointment/appointment-screen.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance-screen.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-screen.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/presentation/menu/menu-model.dart';
import 'package:bst_staff_mobile/presentation/officer/officer-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-screen.dart';
import 'package:bst_staff_mobile/presentation/refer/refer-screen.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarMenu(),
      body: BaseBackground(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: const MenuContent(),
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
}

class MenuContent extends StatefulWidget {
  const MenuContent({super.key});

  @override
  State<MenuContent> createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  late final MenuModel _model;

  @override
  void initState() {
    super.initState();

    _model = MenuModel(
      log: Provider.of<Logger>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuModel>.value(
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
            return Consumer<MenuModel>(
              builder: (context, model, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "เมนูทั้งหมด",
                            style: TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      children: [
                        if (_model.appointment) ...[
                          _buildMenu(
                            name: "Appointment",
                            imagePath: "assets/images/icon_appointment.png",
                            label: "ตารางนัดหมาย",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.patient) ...[
                          _buildMenu(
                            name: "Patient",
                            imagePath: "assets/images/icon_patient.png",
                            label: "ข้อมูลผู้ป่วย",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.assistance) ...[
                          _buildMenu(
                            name: "Assistance",
                            imagePath: "assets/images/icon_assistance.png",
                            label: "ช่วยเหลือ",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.certificate) ...[
                          _buildMenu(
                            name: "Certificate",
                            imagePath: "assets/images/icon_certificate.png",
                            label: "ใบรับรองแพทย์",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.refer) ...[
                          _buildMenu(
                            name: "Refer",
                            imagePath: "assets/images/icon_refer.png",
                            label: "ส่งต่อ/รอรับ",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.dashboard) ...[
                          _buildMenu(
                            name: "Dashboard",
                            imagePath: "assets/images/icon_dashboard.png",
                            label: "แดชบอร์ด",
                            onTap: _onTabMenu,
                          ),
                        ],
                        if (_model.user) ...[
                          _buildMenu(
                            name: "User",
                            imagePath: "assets/images/icon_user.png",
                            label: "จัดการบัญชีผู้ใช้",
                            onTap: _onTabMenu,
                          ),
                        ],
                      ],
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildMenu({
    required String name,
    required String imagePath,
    required String label,
    required Function(String) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(name),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 78,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: FontSizes.small),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _onTabMenu(String name) async {
    try {
      if (name == "Appointment") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppointmentScreen(),
          ),
        );
      } else if (name == "Patient") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PatientScreen(),
          ),
        );
      } else if (name == "Assistance") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AssistanceScreen(),
          ),
        );
      } else if (name == "Certificate") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CertificateScreen(),
          ),
        );
      } else if (name == "Refer") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReferScreen(),
          ),
        );
      } else if (name == "Dashboard") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      } else if (name == "User") {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OfficerScreen(),
          ),
        );
      }
    } on Exception catch (e) {
      if (!context.mounted) return;
      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
