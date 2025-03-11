import 'package:bst_staff_mobile/presentation/history/patient-history-screen.dart';
import 'package:bst_staff_mobile/presentation/home/home-screen.dart';
import 'package:bst_staff_mobile/presentation/menu/menu-screen.dart';
import 'package:bst_staff_mobile/presentation/notification/notification-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-screen.dart';
import 'package:bst_staff_mobile/widget/appbar/base-bottom-navigationbar.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildScreen(_selectedIndex),
      bottomNavigationBar: BaseBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const PatientHistoryScreen();
      case 2:
        return const MenuScreen();
      case 3:
        return const NotificationScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Text('Selected Index: $index');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
