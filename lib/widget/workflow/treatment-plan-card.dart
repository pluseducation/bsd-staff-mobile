import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-status.dart';
import 'package:flutter/material.dart';

class TreatmentPlanCard extends StatelessWidget {
  final Plan data;
  const TreatmentPlanCard({required this.data});

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
                Text(
                  "ลำดับที่ ${data.round}",
                  style: const TextStyle(fontSize: FontSizes.medium),
                ),
                EvalResultTag(
                  lastedEvalResult: data.lastedEvalResult,
                ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              data.planType,
              style: const TextStyle(fontSize: FontSizes.medium),
            ),
            const Divider(
              color: Color(0x804F4F4F),
              thickness: 0.6,
            ),
            Text(
              "หน่วยงาน : ${data.subDivisionName}",
              style: const TextStyle(fontSize: FontSizes.medium),
            ),
            const SizedBox(width: 8),
            Text(
              "วันที่เริ่ม : ${data.startDate}",
              style: const TextStyle(fontSize: FontSizes.medium),
            ),
            const SizedBox(width: 8),
            Text(
              "วันที่สิ้นสุด : ${data.endDate}",
              style: const TextStyle(fontSize: FontSizes.medium),
            ),
            const SizedBox(width: 8),
            Text(
              "ครั้งที่ : ${data.round}",
              style: const TextStyle(fontSize: FontSizes.medium),
            ),
          ],
        ),
      ),
    );
  }
}
