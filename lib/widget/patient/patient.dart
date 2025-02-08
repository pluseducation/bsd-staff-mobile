import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class WorkFlowStatusType extends StatelessWidget {
  final WorkFlowStatus workFlowStatus;

  const WorkFlowStatusType({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    if (workFlowStatus == WorkFlowStatus.registering) {
      color = MainColors.secondaryLight;
      text = 'ลงทะเบียน';
    } else if (workFlowStatus == WorkFlowStatus.screening) {
      color = MainColors.warning;
      text = 'คัดกรอง';
    } else if (workFlowStatus == WorkFlowStatus.treatment) {
      color = MainColors.primary300;
      text = 'บำบัด';
    } else if (workFlowStatus == WorkFlowStatus.monitoring) {
      color = MainColors.success;
      text = 'ติดตาม';
    } else if (workFlowStatus == WorkFlowStatus.assistance) {
      color = MainColors.error;
      text = 'จำหน่าย';
    } else if (workFlowStatus == WorkFlowStatus.discharged) {
      color = Colors.purple;
      text = 'ออกจากโรงพยาบาล';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LevelStatusType extends StatelessWidget {
  final LevelType levelType;

  const LevelStatusType({
    super.key,
    required this.levelType,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';
    Color lightColor = Colors.black;

    if (levelType == LevelType.normal) {
      color = PatientLevelTypeColors.normal;
      lightColor = PatientLevelTypeColors.normalLight;
      text = 'สีเขียว';
    } else if (levelType == LevelType.semiUrgency) {
      color = PatientLevelTypeColors.semiUrgency;
      lightColor = PatientLevelTypeColors.semiUrgencyLight;
      text = 'สีเหลือง';
    } else if (levelType == LevelType.urgency) {
      color = PatientLevelTypeColors.urgency;
      lightColor = PatientLevelTypeColors.urgencyLight;
      text = 'สีส้ม';
    } else if (levelType == LevelType.emergency) {
      color = PatientLevelTypeColors.emergency;
      lightColor = PatientLevelTypeColors.emergencyLight;
      text = 'สีแดง';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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

class DrugEvalResultStatusType extends StatelessWidget {
  final DrugEvalResult drugEvalResult;

  const DrugEvalResultStatusType({
    super.key,
    required this.drugEvalResult,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';
    Color lightColor = Colors.black;

    if (drugEvalResult == DrugEvalResult.user) {
      color = PatientDrugEvalResultColors.drugUser;
      lightColor = PatientDrugEvalResultColors.drugUserLight;
      text = 'ผู้ใช้';
    } else if (drugEvalResult == DrugEvalResult.abuse) {
      color = PatientDrugEvalResultColors.drugAbuse;
      lightColor = PatientDrugEvalResultColors.drugAbuseLight;
      text = 'ผู้เสพ';
    } else if (drugEvalResult == DrugEvalResult.dependence) {
      color = PatientDrugEvalResultColors.drugDependence;
      lightColor = PatientDrugEvalResultColors.drugDependenceLight;
      text = 'ผู้ติด';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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

class TreatmentStatusType extends StatelessWidget {
  final TreatmentType treatmentType;

  const TreatmentStatusType({
    super.key,
    required this.treatmentType,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';
    Color lightColor = Colors.black;

    if (treatmentType == TreatmentType.opd) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ผู้ป่วยนอก';
    } else if (treatmentType == TreatmentType.ipdTreatment) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ผู้ป่วยใน (ระยะบำบัด)';
    } else if (treatmentType == TreatmentType.ipdRecover) {
      color = MainColors.primary500;
      text = 'ผู้ป่วยใน (ระยะฟื้นฟู)';
    } else if (treatmentType == TreatmentType.ipdMini) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'มินิธีญฯ';
    } else if (treatmentType == TreatmentType.cbtx) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'CBTx';
    } else if (treatmentType == TreatmentType.network) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ภาคีเครือข่าย';
    } else if (treatmentType == TreatmentType.religious) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ศาสนสถาน';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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

class MivStatusType extends StatelessWidget {
  final SmivType smivType;

  const MivStatusType({
    super.key,
    required this.smivType,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';
    Color lightColor = Colors.black;

    if (smivType == SmivType.smiv) {
      lightColor = MainColors.error;
      color = MainColors.error;
      text = 'SMIV';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
