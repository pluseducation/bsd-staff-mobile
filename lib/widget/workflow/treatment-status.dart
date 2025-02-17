import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class TreatmentStatusTag extends StatelessWidget {
  final TreatmentStatus? treatmentStatus;

  const TreatmentStatusTag({
    super.key,
    required this.treatmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (treatmentStatus == TreatmentStatus.incompleted) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "ไม่ครบโปรแกรม";
    } else if (treatmentStatus == TreatmentStatus.completed) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "ครบโปรแกรม";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (treatmentStatus == null) {
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

class EvalResultTag extends StatelessWidget {
  final LastedEvalResult? lastedEvalResult;

  const EvalResultTag({
    super.key,
    required this.lastedEvalResult,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (lastedEvalResult == LastedEvalResult.take) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "เสพ";
    } else if (lastedEvalResult == LastedEvalResult.notTake) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "ไม่เสพ";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (lastedEvalResult == null) {
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
