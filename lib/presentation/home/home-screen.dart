import 'package:bst_staff_mobile/presentation/menu/menu-screen.dart';
import 'package:bst_staff_mobile/presentation/test.dart';
import 'package:bst_staff_mobile/widget/appbar/base-bottom-navigationbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _buildScreen(_selectedIndex),
      ),
      bottomNavigationBar: BaseBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const MenuScreen();
      case 1:
        return const MyWidget();
      case 3:
        return const TestStatusView();
      case 4:
        return const CameraTest();
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
