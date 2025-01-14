import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(Icons.home_outlined, "หน้าแรก"),
    NavItem(Icons.search_off_outlined, "ค้นหา"),
    NavItem(Icons.notification_add_outlined, "แจ้งเตือน"),
    NavItem(Icons.person_2_outlined, "โปรไฟล์"),
  ];

  _onNavItemTapped(int index) {
    switch (index) {
      case 0:
        // Handle case 0
        print('Case 0');
        break;
      case 1:
        // Handle case 1
        print('Case 1');
        break;
      case 2:
        // Handle case 2
        print('Case 2');
        break;
      case 3:
        // Handle case 3
        print('Case 3');
        break;
      default:
        // Handle default case
        print('Default case');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(66, 158, 158, 158),
                blurRadius: 10,
              ),
            ],
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(60.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            _onNavItemTapped(0);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[0].icon,
                                size: 30,
                                color: selectedIndex == 0
                                    ? MainColors.primary500
                                    : Colors.black,
                                weight: 20.5,
                              ),
                              Text(
                                _navItems[0].title,
                                style: TextStyle(
                                  color: selectedIndex == 0
                                      ? MainColors.primary500
                                      : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   width: 30,
                        // ),
                        InkWell(
                          onTap: () {
                            _onNavItemTapped(1);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[1].icon,
                                size: 30,
                                color: selectedIndex == 1
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[1].title,
                                style: TextStyle(
                                  color: selectedIndex == 1
                                      ? MainColors.primary500
                                      : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            _onNavItemTapped(2);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[2].icon,
                                size: 30,
                                color: selectedIndex == 2
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[2].title,
                                style: TextStyle(
                                  color: selectedIndex == 2
                                      ? MainColors.primary500
                                      : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onNavItemTapped(3);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[3].icon,
                                size: 30,
                                color: selectedIndex == 3
                                    ? MainColors.primary500
                                    : Colors.black,
                                weight: 100,
                              ),
                              Text(
                                _navItems[3].title,
                                style: TextStyle(
                                  color: selectedIndex == 3
                                      ? MainColors.primary500
                                      : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  // end: Alignment.centerRight,
                  colors: [MainColors.primary300, MainColors.primary700],
                  stops: [0.317, 2.493],
                  // transform: GradientRotation(101.61 * (3.14159 / 180)),
                ),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 64,
                height: 64,
                child: FloatingActionButton(
                  onPressed: () {
                    _onNavItemTapped(5);
                  },
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 30,
                      ),
                      Text("สแกน")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavItem {
  IconData icon;
  String title;
  NavItem(this.icon, this.title);
}
