import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'ใบรับรอง',
        valueListenable: dataNotifier,
      ),
      body: BaseBackground(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: MainColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: CertificateContent(dataNotifier: dataNotifier),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CertificateContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const CertificateContent({
    super.key,
    required this.dataNotifier,
  });

  @override
  State<CertificateContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CertificateContent> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("CertificateContent"),
      ],
    );
  }
}
