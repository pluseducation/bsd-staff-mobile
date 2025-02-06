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

class WorkFlowStatusType1 extends StatelessWidget {
  final WorkFlowStatus workFlowStatus;

  const WorkFlowStatusType1({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    if (workFlowStatus == WorkFlowStatus.registering) {
      color = PatientMainColors.semiurgencybg;
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: FontSizes.small,
        ),
      ),
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

    if (levelType == LevelType.normal) {
      color = PatientMainTextColors.normal;
      text = 'สีเขียว';
    } else if (levelType == LevelType.semiUrgency) {
      color = PatientMainTextColors.semiUrgency;
      text = 'สีเหลือง';
    } else if (levelType == LevelType.urgency) {
      color = PatientMainTextColors.urgency;
      text = 'สีส้ม';
    } else if (levelType == LevelType.emergency) {
      color = PatientMainTextColors.emergency;
      text = 'สีแดง';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
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

    if (drugEvalResult == DrugEvalResult.user) {
      color = PatientMainTextColors.drugUser;
      text = 'ผู้ป่วยใน (ระยะบำบัด)';
    } else if (drugEvalResult == DrugEvalResult.abuse) {
      color = PatientMainTextColors.drugAbuse;
      text = 'ผู้เสพ';
    } else if (drugEvalResult == DrugEvalResult.dependence) {
      color = PatientMainTextColors.drugDependence;
      text = 'ผู้ติด';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
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

    if (treatmentType == TreatmentType.opd) {
      color = PatientMainTextColors.opd;
      text = 'ผู้ป่วยนอก';
    } else if (treatmentType == TreatmentType.ipdTreatment) {
      color = PatientMainTextColors.ipdTreatment;
      text = 'ผู้ป่วยใน (ระยะบำบัด)';
    } else if (treatmentType == TreatmentType.ipdRecover) {
      color = PatientMainTextColors.ipdRecover;
      text = 'ผู้ป่วยใน (ระยะฟื้นฟู)';
    } else if (treatmentType == TreatmentType.ipdMini) {
      color = PatientMainTextColors.ipdMini;
      text = 'มินิธีญฯ';
    } else if (treatmentType == TreatmentType.cbtx) {
      color = PatientMainTextColors.cbtx;
      text = 'CBTx';
    } else if (treatmentType == TreatmentType.network) {
      color = PatientMainTextColors.network;
      text = 'ภาคีเครือข่าย';
    } else if (treatmentType == TreatmentType.religious) {
      color = PatientMainTextColors.religious;
      text = 'ศาสนสถาน';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
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

    if (smivType == SmivType.smiv) {
      color = PatientMainTextColors.smiv;
      text = 'SMIV';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
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
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ค้นหาจากชื่อ-นามสกุล, เลขบัตร/เลขแทน, เลขรอบบำบัด',
                  hintStyle: const TextStyle(
                    color: Color(0xFFA0A6A9),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  filled: true,
                ),
                style: const TextStyle(
                  fontSize: FontSizes.small,
                ),
              ),
            ),
            const Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFFA0A6A9),
            ),
            const SizedBox(width: 4),
            const Text(
              "ตัวกรอง",
              style: TextStyle(
                color: Color(0xFFA0A6A9),
                fontSize: FontSizes.small,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
