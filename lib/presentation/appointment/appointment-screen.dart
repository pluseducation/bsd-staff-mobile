import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/cupertino.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      maxWidth: 600,
      child: Text(
        'นัดหมาย',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
