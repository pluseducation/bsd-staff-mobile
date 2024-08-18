import 'package:bst_staff_mobile/presentation/appointment/appointment-screen.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-screen.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: MainColors.primary500,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'หน้าแรก',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            icon: Icon(Icons.calendar_today_outlined),
            label: 'ผู้ป่วย',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.description,
              color: Colors.white,
            ),
            icon: Icon(Icons.description_outlined),
            label: 'นัดหมาย',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            icon: Icon(Icons.notifications_none_outlined),
            label: 'ใบรับรอง',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person_outline),
            label: 'โปรไฟล์',
            // icon: Badge(
            //   // label: Text('2'),
            //   child: Icon(Icons.person_outline),
            // ),
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const DashboardScreen(),
        const PatientScreen(),
        const AppointmentScreen(),
        const CertificateScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
