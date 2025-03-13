import 'package:bst_staff_mobile/presentation/history/patient-history-screen.dart';
import 'package:bst_staff_mobile/presentation/home/home-screen.dart';
import 'package:bst_staff_mobile/presentation/menu/menu-screen.dart';
import 'package:bst_staff_mobile/presentation/notification/notification-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
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
      floatingActionButton: Container(
        width: 85,
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: () => _onItemTapped(2),
            borderRadius: BorderRadius.circular(
              75 / 2,
            ), // Ensuring circular ripple effect
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: MainColors.primary500,
                shape: BoxShape.circle,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view, color: Colors.white, size: 28),
                  Text(
                    'เมนูทั้งหมด',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
