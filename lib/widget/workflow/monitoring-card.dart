import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/workflow/monitoring-status.dart';
import 'package:flutter/material.dart';

class MonitoringCard extends StatelessWidget {
  final Monitoring data;
  const MonitoringCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ครั้งที่ ${data.round}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.medium,
                  ),
                ),
                TagUsingDrug(
                  usingDrugStatus: data.latestResult,
                ),
              ],
            ),
            const Divider(color: MainColors.divider, thickness: 0.6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "วันที่ติดตาม : ",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                Text(
                  data.startDate,
                  style: const TextStyle(fontSize: FontSizes.medium),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              data.subdivision,
              style: const TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
