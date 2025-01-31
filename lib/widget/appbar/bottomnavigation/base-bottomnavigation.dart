import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatefulWidget {
  final Function(int) onNavItemTapped;
  final int selectedIndex;

  MainBottomNavigationBar({
    required this.onNavItemTapped,
    required this.selectedIndex,
  });

  @override
  _BaseBottomNavigationBarState createState() =>
      _BaseBottomNavigationBarState();
}

class _BaseBottomNavigationBarState extends State<BottomNavigationBar> {
  final List<NavItem> _navItems = [
    NavItem(Icons.home_outlined, "หน้าแรก"),
    NavItem(Icons.person_outline, "ผู้ป่วย"),
    NavItem(Icons.date_range_outlined, "นัดหมาย"),
    NavItem(Icons.description_outlined, "ใบรับรอง"),
    NavItem(Icons.account_circle_outlined, "โปรไฟล์"),
  ];

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
                  ),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            widget.onNavItemTapped(0);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[0].icon,
                                size: 30,
                                color: widget.selectedIndex == 0
                                    ? MainColors.primary500
                                    : Colors.black,
                                weight: 20.5,
                              ),
                              Text(
                                _navItems[0].title,
                                style: TextStyle(
                                  color: widget.selectedIndex == 0
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
                            widget.onNavItemTapped(1);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[1].icon,
                                size: 30,
                                color: widget.selectedIndex == 1
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[1].title,
                                style: TextStyle(
                                  color: widget.selectedIndex == 1
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
                            widget.onNavItemTapped(2);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[2].icon,
                                size: 30,
                                color: widget.selectedIndex == 2
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[2].title,
                                style: TextStyle(
                                  color: widget.selectedIndex == 2
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
                            widget.onNavItemTapped(3);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[3].icon,
                                size: 30,
                                color: widget.selectedIndex == 3
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[3].title,
                                style: TextStyle(
                                  color: widget.selectedIndex == 3
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
                            widget.onNavItemTapped(4);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _navItems[4].icon,
                                size: 30,
                                color: widget.selectedIndex == 4
                                    ? MainColors.primary500
                                    : Colors.black,
                              ),
                              Text(
                                _navItems[4].title,
                                style: TextStyle(
                                  color: widget.selectedIndex == 4
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
      ],
    );
  }
}

class NavItem {
  IconData icon;
  String title;

  NavItem(this.icon, this.title);
}
