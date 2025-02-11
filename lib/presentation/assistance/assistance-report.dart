import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class AssistanceReportScreen extends StatelessWidget {
  const AssistanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: AppBar(
        backgroundColor: MainColors.background,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'รายการความช่วยเหลือ',
            style: TextStyle(
              fontSize: FontSizes.medium,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: const AssistanceReportContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssistanceReportContent extends StatefulWidget {
  const AssistanceReportContent({super.key});

  @override
  State<AssistanceReportContent> createState() =>
      _AssistanceReportContentState();
}

class _AssistanceReportContentState extends State<AssistanceReportContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const AssistanceReportSearch(),
        // const SizedBox(height: 16),
        Text("AssistanceReportContent"),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return Text("data");
        //     },
        //   ),
        // ),
      ],
    );
  }
}
