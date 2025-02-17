import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class UsingDrugTag extends StatelessWidget {
  final UsingDrugStatus? usingDrugStatus;

  const UsingDrugTag({
    super.key,
    required this.usingDrugStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (usingDrugStatus == UsingDrugStatus.usingDrug) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "เสพ";
    } else if (usingDrugStatus == UsingDrugStatus.notUsingDrug) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "ไม่เสพ";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (usingDrugStatus == null) {
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
          child: Text(
            text,
            style: TextStyle(
              fontSize: FontSizes.small,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
