import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-type.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-selectl.dart';
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
          child: MyWidgets(),
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: MainColors.primary500),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "สมชาย หวังผล",
                            style: TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WorkFlowStatusType1(
                            workFlowStatus: WorkFlowStatus.monitoring,
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFDEE2E4),
                        thickness: 0.8,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.credit_card,
                                  size: 18, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                "1579900499231 (แทน)",
                                style: TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              // check สถานะ หากมีค่าส่งไป หากไม่มี ไม่ต้องการshow
                              LevelStatusType(levelType: LevelType.urgency),

                              DrugEvalResultStatusType(
                                drugEvalResult: DrugEvalResult.dependence,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "รอบบำบัด : 653210",
                            style: TextStyle(
                                fontSize: FontSizes.small, color: Colors.grey),
                          ),
                          TreatmentStatusType(
                            treatmentType: TreatmentType.ipdTreatment,
                          ),
                        ],
                      ),
                    ],
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

class TestPatiaSelectlScreen extends StatelessWidget {
  const TestPatiaSelectlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBarContent(
        title: "Test Patia Selectl",
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TestPatiaContent(),
      ),
    );
  }
}

class TestPatiaContent extends StatelessWidget {
  const TestPatiaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "สถานะ",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 4),
        PatiaStatusSelectl(
          onSelected: (WorkFlowStatus status) {
            print("สถานะที่เลือก:==>>> $status");
          },
        ),
        const SizedBox(height: 4),
        const Text(
          "OAS",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 4),
        PatiaOASSelectl(
          onSelected: (LevelType status) {
            print("OAS ที่เลือก:==>>> $status");
          },
        ),
        SizedBox(height: 4),
        const Text(
          "V2",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        DrugEvalResultSelectl(
          onSelected: (DrugEvalResult status) {
            print("DrugEvalResult ที่เลือก:==>>> $status");
          },
        ),
        const SizedBox(height: 4),
        const Text(
          "ประเภท การบำบัดรักษาล่าสุด",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 4),
        TreatmentTypeSelectl(
          onSelected: (TreatmentType status) {
            print("TreatmentType ที่เลือก:==>>> $status");
          },
        ),
        const SizedBox(height: 4),
        const Text(
          "สถานะเพิ่มเติม",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 4),
        SmivTypeSelectl(
          onSelected: (SmivType status) {
            print("SmivType ที่เลือก:==>>> $status");
          },
        ),
      ],
    );
  }
}
