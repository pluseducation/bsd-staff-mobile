import 'package:bst_staff_mobile/presentation/manu/manu-screen.dart';
import 'package:bst_staff_mobile/presentation/test.dart';
import 'package:bst_staff_mobile/widget/appbar/bottomnavigation/base-bottomnavigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _selectedIndex == 0
            ? const ManuScreen()
            : _selectedIndex == 1
                ? const MyWidget()
                : _selectedIndex == 3
                    ? const TestStatusView()
                    : _selectedIndex == 4
                        ? const TestPatiaSelectlScreen()
                        : Text('Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
