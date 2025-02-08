import 'package:bst_staff_mobile/presentation/patient/patient-select-search-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/patient/patient-card.dart';
import 'package:bst_staff_mobile/widget/patient/patient-search.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppBarContent(
        title: 'ผู้ป่วย',
        count: 2000,
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
                            child: PatientContent(),
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

class PatientContent extends StatefulWidget {
  const PatientContent({super.key});

  @override
  State<PatientContent> createState() => _PatientContentState();
}

class _PatientContentState extends State<PatientContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBarWidget(
          onClick: () {
            _onOpenSearch();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const PatientCard(),
      ],
    );
  }

  Future<void> _onOpenSearch() async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PatientSelectSearchScreen(),
        ),
      );
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
