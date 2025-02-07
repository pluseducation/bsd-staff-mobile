import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class CertificateStatusType extends StatelessWidget {
  final CertificateStatus certificateStatus;

  const CertificateStatusType({
    super.key,
    required this.certificateStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    Color lightColor = Colors.black;

    if (certificateStatus == CertificateStatus.request) {
      color = CertificateColors.request;
      lightColor = CertificateColors.requestLight;
      text = 'รายการขอ';
    } else if (certificateStatus == CertificateStatus.completed) {
      color = CertificateColors.completed;
      lightColor = CertificateColors.completedLight;
      text = 'อนุมัติ';
    } else if (certificateStatus == CertificateStatus.denied) {
      color = CertificateColors.denied;
      lightColor = CertificateColors.deniedLight;
      text = 'ปฏิเสธ';
    } else {
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: lightColor,
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

class CertificateDrugType extends StatelessWidget {
  final DrugEvalResult drugEvalResult;

  const CertificateDrugType({
    super.key,
    required this.drugEvalResult,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
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

class CertificateWorkFlowType extends StatelessWidget {
  final WorkFlowStatus workFlowStatus;

  const CertificateWorkFlowType({
    super.key,
    required this.workFlowStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    Color lightColor = Colors.black;

    if (workFlowStatus == WorkFlowStatus.registering) {
      color = PatientStatusColors.registering;
      lightColor = PatientStatusColors.registeringLight;
      text = 'ลงทะเบียน';
    } else if (workFlowStatus == WorkFlowStatus.screening) {
      color = PatientStatusColors.screening;
      lightColor = PatientStatusColors.screeningLight;
      text = 'คัดกรอง';
    } else if (workFlowStatus == WorkFlowStatus.treatment) {
      color = PatientStatusColors.treatment;
      lightColor = PatientStatusColors.treatmentLight;
      text = 'บำบัด';
    } else if (workFlowStatus == WorkFlowStatus.monitoring) {
      color = PatientStatusColors.monitoring;
      lightColor = PatientStatusColors.monitoringLight;
      text = 'ติดตาม';
    } else if (workFlowStatus == WorkFlowStatus.assistance) {
      color = PatientStatusColors.assistance;
      lightColor = PatientStatusColors.assistanceLight;
      text = 'ช่วยเหลือ';
    } else if (workFlowStatus == WorkFlowStatus.discharged) {
      color = PatientStatusColors.discharged;
      lightColor = PatientStatusColors.dischargedLight;
      text = 'จำหน่าย';
    } else {
      color = Colors.grey;
      text = 'unknown';
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

class CertificateLevelType extends StatelessWidget {
  final LevelType levelType;

  const CertificateLevelType({
    super.key,
    required this.levelType,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
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
