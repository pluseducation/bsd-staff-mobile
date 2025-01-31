import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
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
      appBar: const BaseAppBarHome(),
      body: Center(child: Text('Selected Index: $_selectedIndex')),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
