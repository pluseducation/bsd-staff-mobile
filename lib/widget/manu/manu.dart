import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:flutter/material.dart';

class BaseMenu extends StatelessWidget {
  final int id;
  final String imagePath;
  final String label;
  final Function(int) onTap;

  const BaseMenu({
    super.key,
    required this.id,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(id),
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
}

class AppointmentMenu extends StatelessWidget {
  final Function(int) onTap;
  const AppointmentMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 1,
      imagePath: "assets/images/icon_appointment.png",
      label: "ตารางนัดหมาย",
      onTap: onTap,
    );
  }
}

class PatientMenu extends StatelessWidget {
  final Function(int) onTap;
  const PatientMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 2,
      imagePath: "assets/images/icon_patient.png",
      label: "ข้อมูลผู้ป่วย",
      onTap: onTap,
    );
  }
}

class HelpMenu extends StatelessWidget {
  final Function(int) onTap;
  const HelpMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 3,
      imagePath: "assets/images/icon_help.png",
      label: "ช่วยเหลือ",
      onTap: onTap,
    );
  }
}

class CertificateMenu extends StatelessWidget {
  final Function(int) onTap;
  const CertificateMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 3,
      imagePath: "assets/images/icon_certificate.png",
      label: "ช่วยเหลือ",
      onTap: onTap,
    );
  }
}

class ForwardMenu extends StatelessWidget {
  final Function(int) onTap;
  const ForwardMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 5,
      imagePath: "assets/images/icon_forward.png",
      label: "ส่งต่อ/รอรับ",
      onTap: onTap,
    );
  }
}

class DashboardMenu extends StatelessWidget {
  final Function(int) onTap;
  const DashboardMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 6,
      imagePath: "assets/images/icon_dashboard.png",
      label: "แดชบอร์ด",
      onTap: onTap,
    );
  }
}

class SettingUserMenu extends StatelessWidget {
  final Function(int) onTap;
  const SettingUserMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseMenu(
      id: 7,
      imagePath: "assets/images/icon_settinguser.png",
      label: "จัดการบัญชีผู้ใช้",
      onTap: onTap,
    );
  }
}
