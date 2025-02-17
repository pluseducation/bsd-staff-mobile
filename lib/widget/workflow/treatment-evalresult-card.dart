import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-status.dart';
import 'package:flutter/material.dart';

class TreatmentEvalresultCard extends StatelessWidget {
  final TreatmentStatus? status;
  final String date;
  final String completedReasonText;
  final String mentalTreatmentResultText;
  final String physicalTreatmentResultText;
  final String incompletedReasonText;

  const TreatmentEvalresultCard({
    required this.status,
    required this.date,
    required this.completedReasonText,
    required this.mentalTreatmentResultText,
    required this.physicalTreatmentResultText,
    required this.incompletedReasonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: MainColors.primary500,
        ),
        borderRadius: BorderRadius.circular(8), // Set the border radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "วันที่ประเมินผล",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TreatmentStatusTag(
                  treatmentStatus: status,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const Divider(
              color: Color(0x804F4F4F),
              thickness: 0.6,
            ),
            if (status == TreatmentStatus.completed) ...[
              Text(
                mentalTreatmentResultText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                physicalTreatmentResultText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
            ] else ...[
              Text(
                incompletedReasonText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
