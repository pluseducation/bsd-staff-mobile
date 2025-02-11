import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance-report.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/assistance/assistance.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:flutter/material.dart';

class AssistanceCard extends StatelessWidget {
  final Assistance assistance;
  const AssistanceCard({
    super.key,
    required this.assistance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("AssistanceReportScreen");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AssistanceReportScreen(
            //         // assistance: assistance,
            //         ),
            //   ),
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: MainColors.primary500, width: 0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            assistance.fullName,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WorkFlowStatusType(
                            workFlowStatus: assistance.workFlowStatus,
                          ),
                        ],
                      ),
                      const Divider(
                        color: MainColors.divider,
                        thickness: 0.6,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                assistance.nationalId,
                                style: const TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              AssistanceStatusType(
                                assistanceStatus: assistance.assistanceStatus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รอบบำบัด : ${assistance.cycle}',
                            style: const TextStyle(
                              fontSize: FontSizes.small,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
