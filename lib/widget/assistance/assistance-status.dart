import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class AssistanceStatusType extends StatelessWidget {
  final AssistanceStatus? assistanceStatus;

  const AssistanceStatusType({
    super.key,
    required this.assistanceStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (assistanceStatus == AssistanceStatus.pending) {
      color = AssistanceColors.pending;
      lightColor = AssistanceColors.pendingLight;
      text = "รอดำเนินการ";
    } else if (assistanceStatus == AssistanceStatus.inprogress) {
      color = AssistanceColors.inprogress;
      lightColor = AssistanceColors.inprogressLight;
      text = "กำลังดำเนินการ";
    } else if (assistanceStatus == AssistanceStatus.completed) {
      color = AssistanceColors.completed;
      lightColor = AssistanceColors.completedLight;
      text = "เสร็จสิ้น";
    } else if (assistanceStatus == AssistanceStatus.canceled) {
      color = AssistanceColors.canceled;
      lightColor = AssistanceColors.canceledLight;
      text = "ยกเลิก";
    } else {
      color = Colors.grey;
      lightColor = Colors.grey;
      text = '-';
    }

    if (assistanceStatus == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: FontSizes.small,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AssistanceItemStatusType extends StatelessWidget {
  final AssistanceItemStatus? assistanceItemStatus;

  const AssistanceItemStatusType({
    super.key,
    required this.assistanceItemStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (assistanceItemStatus == AssistanceItemStatus.pending) {
      color = AssistanceColors.pending;
      lightColor = AssistanceColors.pendingLight;
      text = "รอดำเนินการ";
    } else if (assistanceItemStatus == AssistanceItemStatus.inprogress) {
      color = AssistanceColors.inprogress;
      lightColor = AssistanceColors.inprogressLight;
      text = "กำลังดำเนินการ";
    } else if (assistanceItemStatus == AssistanceItemStatus.completed) {
      color = AssistanceColors.completed;
      lightColor = AssistanceColors.completedLight;
      text = "เสร็จสิ้น";
    } else if (assistanceItemStatus == AssistanceItemStatus.exceed) {
      color = AssistanceColors.canceled;
      lightColor = AssistanceColors.canceledLight;
      text = "ไม่สามารถให้ความช่วยเหลือได้";
    } else {
      color = Colors.grey;
      lightColor = Colors.grey;
      text = '-';
    }

    if (assistanceItemStatus == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: FontSizes.small,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
