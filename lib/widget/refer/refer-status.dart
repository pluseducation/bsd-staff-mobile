import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class SenderStatusType extends StatelessWidget {
  final ReferStatus? referStatus;

  const SenderStatusType({
    super.key,
    required this.referStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (referStatus == ReferStatus.referring) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "กำลังส่งต่อ";
    } else if (referStatus == ReferStatus.accepted) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "อนุมัติ";
    } else if (referStatus == ReferStatus.rejected) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "ปฏิเสธ";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (referStatus == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: lightColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: 12,
                height: 12,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiverStatusType extends StatelessWidget {
  final ReferStatus? referStatus;

  const ReceiverStatusType({
    super.key,
    required this.referStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (referStatus == ReferStatus.referring) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "รอการตอบรับ";
    } else if (referStatus == ReferStatus.accepted) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "อนุมัติ";
    } else if (referStatus == ReferStatus.rejected) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "ปฏิเสธ";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (referStatus == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: lightColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: 12,
                height: 12,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
