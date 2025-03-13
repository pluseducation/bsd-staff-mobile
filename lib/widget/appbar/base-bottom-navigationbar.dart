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
    return BottomNavigationBar(
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
    );
  }
}
