import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:flutter/material.dart';

class PatientHistoryCard extends StatelessWidget {
  final PatientHistory data;
  const PatientHistoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                        Row(
                          children: [
                            // Text cricle number background color primary500
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: MainColors.primary500,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                data.no.toString(),
                                style: const TextStyle(
                                  fontSize: FontSizes.small,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              data.cycle,
                              style: const TextStyle(
                                fontSize: FontSizes.medium,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        WorkFlowStatusType(
                          workFlowStatus: data.workFlowStatus,
                        ),
                      ],
                    ),
                    const Divider(
                      color: MainColors.divider,
                      thickness: 0.6,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'วันที่ลงทะเบียน : ${data.createdAt}',
                      style: const TextStyle(
                        fontSize: FontSizes.medium,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'หน่วยงาน : ${data.subDivisionName}',
                      style: const TextStyle(
                        fontSize: FontSizes.medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
