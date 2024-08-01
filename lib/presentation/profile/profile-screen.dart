import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      maxWidth: 600,
      child: Text(
        'โปรไฟล์',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
