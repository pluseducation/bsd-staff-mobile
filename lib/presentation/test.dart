import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-type.dart';
import 'package:bst_staff_mobile/widget/appointment/card-partial.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-search.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-select-search.dart';
import 'package:bst_staff_mobile/widget/appointment/patient.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Test AppointmentStatus',
          style: TextStyle(color: MainColors.white),
        ),
        backgroundColor: MainColors.primary500,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidgets extends StatefulWidget {
  const MyWidgets({super.key});

  @override
  State<MyWidgets> createState() => _MyWidgetsState();
}

class _MyWidgetsState extends State<MyWidgets> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Patient - Test",
              style: TextStyle(
                  fontSize: FontSizes.large, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assistance",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatusType(
                  appointmentType: AppointmentType.assistance,
                  round: 1,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monitoring",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatusType(
                  appointmentType: AppointmentType.monitoring,
                  round: 2,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Treatment",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatusType(
                  appointmentType: AppointmentType.treatment,
                  round: 3,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reject",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatusType(
                  appointmentType: AppointmentType.reject,
                  round: 4,
                ),
              ],
            ),
            SizedBox(height: 8),
            WorkFlowStatusType1(
              workFlowStatus: WorkFlowStatus.treatment,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                LevelStatusType(levelType: LevelType.urgency),
                DrugEvalResultStatusType(
                  drugEvalResult: DrugEvalResult.dependence,
                ),
                TreatmentStatusType(
                  treatmentType: TreatmentType.opd,
                ),
              ],
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                TreatmentStatusType(
                  treatmentType: TreatmentType.ipdTreatment,
                ),
                MivStatusType(smivType: SmivType.smiv),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class TestStatusView extends StatelessWidget {
  const TestStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Test Status View",
          style: TextStyle(color: MainColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBarWidget(),
            const SizedBox(
              height: 16,
            ),
            const Cardpatient(),
          ],
        ),
      ),
    );
  }
}

class TestPatiaSelectlScreen extends StatelessWidget {
  const TestPatiaSelectlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBarContent(
        title: "Test Patia Selectl",
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PatientSelectSearch(),
      ),
    );
  }
}
