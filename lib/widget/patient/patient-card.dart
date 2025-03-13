import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  const PatientCard({super.key, required this.patient});

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
                        Text(
                          patient.fullName,
                          style: const TextStyle(
                            fontSize: FontSizes.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WorkFlowStatusType(
                          workFlowStatus: patient.workFlowStatus,
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
                              patient.nationalId,
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
                            LevelStatusType(levelType: patient.levelType),
                            DrugEvalResultStatusType(
                              drugEvalResult: patient.drugEvalResult,
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
                          'รอบบำบัด : ${patient.cycle}',
                          style: const TextStyle(
                            fontSize: FontSizes.small,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            TreatmentStatusType(
                              treatmentType: patient.treatmentType,
                            ),
                            SmivStatusType(
                              smivType: patient.smivType,
                            ),
                          ],
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
