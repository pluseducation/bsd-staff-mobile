import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-select-search.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class PatientSelectSearchScreen extends StatelessWidget {
  const PatientSelectSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppBarContent(
        title: 'ผู้ป่วย',
        count: 1000,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MainColors.primary500,
                  Colors.white,
                ],
                stops: [-0.017, 1.2193],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(280 * (3.14159 / 50)),
              ),
              color: Colors.white12,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: PatientEelectSearchContent(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientEelectSearchContent extends StatefulWidget {
  const PatientEelectSearchContent({super.key});

  @override
  State<PatientEelectSearchContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PatientEelectSearchContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PatientSelectSearch(
          // onClick: _onOpenSearch,
          onSearch: (Search) {
            print("Search:===>>> $Search");
          },
        ),
      ],
    );
  }

  Future<void> _onOpenSearch() async {
    try {
      Navigator.pop(context);
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
