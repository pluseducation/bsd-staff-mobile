import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class WorkFlowStatusType extends StatelessWidget {
  final WorkFlowStatus? workFlowStatus;

  const WorkFlowStatusType({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (workFlowStatus == WorkFlowStatus.registering) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "ลงทะเบียน";
    } else if (workFlowStatus == WorkFlowStatus.screening) {
      lightColor = MainColors.warningLight;
      color = MainColors.warning;
      text = "คัดกรอง";
    } else if (workFlowStatus == WorkFlowStatus.treatment) {
      lightColor = MainColors.infoLight;
      color = MainColors.info;
      text = "บำบัด";
    } else if (workFlowStatus == WorkFlowStatus.monitoring) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "ติดตาม";
    } else if (workFlowStatus == WorkFlowStatus.assistance) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "ช่วยเหลือ";
    } else if (workFlowStatus == WorkFlowStatus.discharged) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "จำหน่าย";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (workFlowStatus == null) {
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
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class WorkFlowStatusTypeEmpty extends StatelessWidget {
  final WorkFlowStatus? workFlowStatus;

  const WorkFlowStatusTypeEmpty({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    const color = MainColors.secondary;
    const lightColor = MainColors.natural;
    String text;

    if (workFlowStatus == WorkFlowStatus.registering) {
      text = "ลงทะเบียน";
    } else if (workFlowStatus == WorkFlowStatus.screening) {
      text = "คัดกรอง";
    } else if (workFlowStatus == WorkFlowStatus.treatment) {
      text = "บำบัด";
    } else if (workFlowStatus == WorkFlowStatus.monitoring) {
      text = "ติดตาม";
    } else if (workFlowStatus == WorkFlowStatus.assistance) {
      text = "ช่วยเหลือ";
    } else if (workFlowStatus == WorkFlowStatus.discharged) {
      text = "จำหน่าย";
    } else {
      text = '-';
    }

    if (workFlowStatus == null) {
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
            style: const TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class WorkFlowStatusTypeSelect extends StatelessWidget {
  final WorkFlowStatus? workFlowStatus;

  const WorkFlowStatusTypeSelect({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color lightColor;
    String text;

    if (workFlowStatus == WorkFlowStatus.registering) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "ลงทะเบียน";
    } else if (workFlowStatus == WorkFlowStatus.screening) {
      lightColor = MainColors.warningLight;
      color = MainColors.warning;
      text = "คัดกรอง";
    } else if (workFlowStatus == WorkFlowStatus.treatment) {
      lightColor = MainColors.infoLight;
      color = MainColors.info;
      text = "บำบัด";
    } else if (workFlowStatus == WorkFlowStatus.monitoring) {
      lightColor = MainColors.successLight;
      color = MainColors.success;
      text = "ติดตาม";
    } else if (workFlowStatus == WorkFlowStatus.assistance) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.secondary;
      text = "ช่วยเหลือ";
    } else if (workFlowStatus == WorkFlowStatus.discharged) {
      lightColor = MainColors.errorLight;
      color = MainColors.error;
      text = "จำหน่าย";
    } else {
      lightColor = Colors.grey;
      color = Colors.grey;
      text = '-';
    }

    if (workFlowStatus == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LevelStatusType extends StatelessWidget {
  final LevelType? levelType;

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
      text = '-';
    }

    if (levelType == null) {
      return Container();
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

class LevelStatusTypeEmpty extends StatelessWidget {
  final LevelType? levelType;

  const LevelStatusTypeEmpty({
    super.key,
    required this.levelType,
  });

  @override
  Widget build(BuildContext context) {
    const color = MainColors.secondary;
    const lightColor = MainColors.natural;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (levelType == LevelType.normal) {
      text = 'สีเขียว';
    } else if (levelType == LevelType.semiUrgency) {
      text = 'สีเหลือง';
    } else if (levelType == LevelType.urgency) {
      text = 'สีส้ม';
    } else if (levelType == LevelType.emergency) {
      text = 'สีแดง';
    } else {
      text = '-';
    }

    if (levelType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        border: Border.all(
          color: lightColor,
        ),
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
            style: const TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LevelStatusTypeSelect extends StatelessWidget {
  final LevelType? levelType;

  const LevelStatusTypeSelect({
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
      text = '-';
    }

    if (levelType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
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
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LevelStatusTypeLabel extends StatelessWidget {
  final LevelType? levelType;

  const LevelStatusTypeLabel({
    super.key,
    required this.levelType,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (levelType == LevelType.normal) {
      color = PatientLevelTypeColors.normal;
      text = 'สีเขียว ไม่มีอาการ';
    } else if (levelType == LevelType.semiUrgency) {
      color = PatientLevelTypeColors.semiUrgency;
      text = 'สีเหลือง กึ่งเร่งด่วน (Semi-Urgency)';
    } else if (levelType == LevelType.urgency) {
      color = PatientLevelTypeColors.urgency;
      text = 'สีส้ม เร่งด่วน (Urgency)';
    } else if (levelType == LevelType.emergency) {
      color = PatientLevelTypeColors.emergency;
      text = 'สีแดง ฉุกเฉิน (Emergency)';
    } else {
      color = Colors.grey;
      text = '-';
    }

    if (levelType == null) {
      return Container();
    }

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: FontSizes.medium,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DrugEvalResultStatusType extends StatelessWidget {
  final DrugEvalResult? drugEvalResult;

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
      text = '-';
    }

    if (drugEvalResult == null) {
      return Container();
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

class DrugEvalResultStatusTypeEmpty extends StatelessWidget {
  final DrugEvalResult? drugEvalResult;

  const DrugEvalResultStatusTypeEmpty({
    super.key,
    required this.drugEvalResult,
  });

  @override
  Widget build(BuildContext context) {
    const color = MainColors.secondary;
    const lightColor = MainColors.natural;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (drugEvalResult == DrugEvalResult.user) {
      text = 'ผู้ใช้';
    } else if (drugEvalResult == DrugEvalResult.abuse) {
      text = 'ผู้เสพ';
    } else if (drugEvalResult == DrugEvalResult.dependence) {
      text = 'ผู้ติด';
    } else {
      text = '-';
    }

    if (drugEvalResult == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        border: Border.all(
          color: lightColor,
        ),
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
            style: const TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DrugEvalResultStatusTypeSelect extends StatelessWidget {
  final DrugEvalResult? drugEvalResult;

  const DrugEvalResultStatusTypeSelect({
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
      text = '-';
    }

    if (drugEvalResult == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
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
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DrugEvalResultStatusTypeLabel extends StatelessWidget {
  final DrugEvalResult? drugEvalResult;

  const DrugEvalResultStatusTypeLabel({
    super.key,
    required this.drugEvalResult,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    if (drugEvalResult == DrugEvalResult.user) {
      color = PatientDrugEvalResultColors.drugUser;
      text = 'ผู้ใช้ (User, กลุ่มเสี่ยงต่ำ)';
    } else if (drugEvalResult == DrugEvalResult.abuse) {
      color = PatientDrugEvalResultColors.drugAbuse;
      text = 'ผู้เสพ (Abuse, กลุ่มเสี่ยงปานกลาง)';
    } else if (drugEvalResult == DrugEvalResult.dependence) {
      color = PatientDrugEvalResultColors.drugDependence;
      text = 'ผู้ติด (Dependence, กลุ่มเสี่ยงสูง)';
    } else {
      color = Colors.grey;
      text = '-';
    }

    if (drugEvalResult == null) {
      return Container();
    }

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: FontSizes.medium,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TreatmentStatusType extends StatelessWidget {
  final TreatmentType? treatmentType;

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
      lightColor = MainColors.primary500;
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
    } else if (treatmentType == TreatmentType.rehabilitationTherapyJopc) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'สถานพินิจ';
    } else if (treatmentType ==
        TreatmentType.rehabilitationTherapyTrainingCenter) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ศูนย์ฝึกและอบรม';
    } else if (treatmentType == TreatmentType.wiwatSchoolProject) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'โรงเรียนวิวัฒน์';
    } else if (treatmentType == TreatmentType.programInPrisons) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'กรมราชทัณฑ์';
    } else if (treatmentType == TreatmentType.behaviorCamp) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'หลักสูตรค่าย';
    } else if (treatmentType == TreatmentType.other) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'อื่นๆ';
    } else {
      color = Colors.grey;
      text = '-';
    }

    if (treatmentType == null) {
      return Container();
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

class TreatmentStatusTypeEmpty extends StatelessWidget {
  final TreatmentType? treatmentType;

  const TreatmentStatusTypeEmpty({
    super.key,
    required this.treatmentType,
  });

  @override
  Widget build(BuildContext context) {
    const color = MainColors.secondary;
    const lightColor = MainColors.natural;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (treatmentType == TreatmentType.opd) {
      text = 'ผู้ป่วยนอก';
    } else if (treatmentType == TreatmentType.ipdTreatment) {
      text = 'ผู้ป่วยใน (ระยะบำบัด)';
    } else if (treatmentType == TreatmentType.ipdRecover) {
      text = 'ผู้ป่วยใน (ระยะฟื้นฟู)';
    } else if (treatmentType == TreatmentType.ipdMini) {
      text = 'มินิธีญฯ';
    } else if (treatmentType == TreatmentType.cbtx) {
      text = 'CBTx';
    } else if (treatmentType == TreatmentType.network) {
      text = 'ภาคีเครือข่าย';
    } else if (treatmentType == TreatmentType.religious) {
      text = 'ศาสนสถาน';
    } else if (treatmentType == TreatmentType.rehabilitationTherapyJopc) {
      text = 'สถานพินิจ';
    } else if (treatmentType ==
        TreatmentType.rehabilitationTherapyTrainingCenter) {
      text = 'ศูนย์ฝึกและอบรม';
    } else if (treatmentType == TreatmentType.wiwatSchoolProject) {
      text = 'โรงเรียนวิวัฒน์';
    } else if (treatmentType == TreatmentType.programInPrisons) {
      text = 'กรมราชทัณฑ์';
    } else if (treatmentType == TreatmentType.behaviorCamp) {
      text = 'หลักสูตรค่าย';
    } else if (treatmentType == TreatmentType.other) {
      text = 'อื่นๆ';
    } else {
      text = '-';
    }

    if (treatmentType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        border: Border.all(
          color: lightColor,
        ),
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
            style: const TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TreatmentStatusTypeSelect extends StatelessWidget {
  final TreatmentType? treatmentType;

  const TreatmentStatusTypeSelect({
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
      lightColor = MainColors.primary500;
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
    } else if (treatmentType == TreatmentType.rehabilitationTherapyJopc) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'สถานพินิจ';
    } else if (treatmentType ==
        TreatmentType.rehabilitationTherapyTrainingCenter) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'ศูนย์ฝึกและอบรม';
    } else if (treatmentType == TreatmentType.wiwatSchoolProject) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'โรงเรียนวิวัฒน์';
    } else if (treatmentType == TreatmentType.programInPrisons) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'กรมราชทัณฑ์';
    } else if (treatmentType == TreatmentType.behaviorCamp) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'หลักสูตรค่าย';
    } else if (treatmentType == TreatmentType.other) {
      color = MainColors.primary500;
      lightColor = MainColors.primary500;
      text = 'อื่นๆ';
    } else {
      color = Colors.grey;
      text = '-';
    }

    if (treatmentType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
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
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MivStatusType extends StatelessWidget {
  final SmivType? smivType;

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
      text = '-';
    }

    if (smivType == null) {
      return Container();
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

class SmivStatusTypeEmpty extends StatelessWidget {
  final SmivType? smivType;

  const SmivStatusTypeEmpty({
    super.key,
    required this.smivType,
  });

  @override
  Widget build(BuildContext context) {
    const color = MainColors.secondary;
    const lightColor = MainColors.natural;
    String text;
    const String iconPath = 'assets/images/icon_tag.png';

    if (smivType == SmivType.smiv) {
      text = 'SMIV';
    } else {
      text = '-';
    }

    if (smivType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        border: Border.all(
          color: lightColor,
        ),
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
            style: const TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SmivStatusTypeSelect extends StatelessWidget {
  final SmivType? smivType;

  const SmivStatusTypeSelect({
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
      text = '-';
    }

    if (smivType == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
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
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
