import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:flutter/material.dart';

class TreatmentHistoryCard extends StatelessWidget {
  final TreatmentHistory data;
  const TreatmentHistoryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data.subDivisionName} จำนวน ${data.times} ครั้ง",
          style: const TextStyle(fontSize: FontSizes.medium),
        ),
        Text(
          "วันที่ใช้ล่าสุด ${data.lastestUsedDate}",
          style: const TextStyle(fontSize: FontSizes.medium),
        ),
      ],
    );
  }
}
