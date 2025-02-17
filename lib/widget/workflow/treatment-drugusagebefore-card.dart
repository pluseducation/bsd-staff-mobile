import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:flutter/material.dart';

class TreatmentDrugusagebeforeCard extends StatelessWidget {
  final DrugUsageBefore data;
  const TreatmentDrugusagebeforeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Text(
                data.order.toString(),
                style: const TextStyle(
                  fontSize: FontSizes.small,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ชื่อยาเสพติด : ${data.drug}",
                  style: const TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                Text(
                  "ปีที่เริ่มใช้ : ${data.firstYearUsage}",
                  style: const TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
