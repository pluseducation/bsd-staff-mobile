import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/cupertino.dart';

class CretificateScreen extends StatefulWidget {
  const CretificateScreen({super.key});

  @override
  State<CretificateScreen> createState() => _CretificateScreenState();
}

class _CretificateScreenState extends State<CretificateScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      maxWidth: 600,
      child: Text(
        'ใบรับรอง',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
