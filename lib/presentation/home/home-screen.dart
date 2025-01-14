import 'package:bst_staff_mobile/presentation/appointment/appointment-screen.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-screen.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-screen.dart';
import 'package:bst_staff_mobile/presentation/profile/profile-screen.dart';
import 'package:bst_staff_mobile/widget/appbar/bottomnavigation/base-bottomnavigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });

    _pageController.jumpToPage(index);
    // _pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 100),
    //   curve: Curves.linear,
    // );
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      // appBar: BaseAppbar(),
      bottomNavigationBar: BaseBottomNavigationBar(
        onNavItemTapped: _onNavItemTapped,
        selectedIndex: currentPageIndex,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: const <Widget>[
          /// Home page

          // DashboardScreen(),
          // PatientScreen(),
          // AppointmentScreen(),
          // CertificateScreen(),
          // ProfileScreen(),
        ],
      ),
    );
  }
}
