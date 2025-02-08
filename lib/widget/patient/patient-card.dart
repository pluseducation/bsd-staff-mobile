import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        WorkFlowStatusType(
                          workFlowStatus: WorkFlowStatus.monitoring,
                        ),
                      ],
                    ),
                    Divider(
                      color: MainColors.divider,
                      thickness: 0.6,
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
                                color: MainColors.text,
                                fontSize: FontSizes.small,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
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
                            fontSize: FontSizes.small,
                            color: MainColors.text,
                          ),
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
    );
  }
}
