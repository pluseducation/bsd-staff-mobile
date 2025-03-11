import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class BaseBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BaseBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: MainColors.primary500,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontSize: 13),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  currentIndex == 0
                      ? 'assets/images/icon_home_fill.png'
                      : 'assets/images/icon_home.png',
                ),
                size: 24,
              ),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  currentIndex == 1
                      ? 'assets/images/icon_search_fill.png'
                      : 'assets/images/icon_search.png',
                ),
                size: 24,
              ),
              label: 'ค้นหา',
            ),
            const BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  currentIndex == 3
                      ? 'assets/images/icon_notification_fill.png'
                      : 'assets/images/icon_notification.png',
                ),
                size: 24,
              ),
              label: 'แจ้งเตือน',
            ),
            // icon_notification.png
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  currentIndex == 4
                      ? 'assets/images/icon_profile_fill.png'
                      : 'assets/images/icon_profile.png',
                ),
                size: 24,
              ),
              label: 'โปรไฟล์',
            ),
          ],
        ),
        Positioned(
          top: -50,
          left: MediaQuery.of(context).size.width / 2 - (85 / 2),
          child: Container(
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
                onTap: () => onTap(2),
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
        ),
      ],
    );
  }
}
