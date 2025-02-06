// สถานะ
enum WorkFlowStatus {
  registering,
  screening,
  treatment,
  monitoring,
  assistance,
  discharged
}
// ตัวกรอง ผู้ใช้ ผู้เสพ ผู้ติด

// OAS เขียว เหลือง ส้ม แดง
enum LevelType { normal, semiUrgency, urgency, emergency }

// V2
enum DrugEvalResult { user, abuse, dependence }

// ประเภท การบำบัดรักษาล่าสุด
enum TreatmentType {
  opd,
  ipdTreatment,
  ipdRecover,
  ipdMini,
  cbtx,
  network,
  religious,
  rehabilitationTherapyJopc,
  rehabilitationTherapyTrainingCenter,
  wiwatSchoolProject,
  programInPrisons,
  behaviorCamp,
  other
}

//สถานะเพิ่มเติม
enum SmivType { smiv }

enum AppointmentType {
  assistance,
  monitoring,
  treatment,
  reject;

  static AppointmentType? setValue(String? value) {
    switch (value) {
      case "ASSISTANCE":
        return AppointmentType.assistance;
      case "MONITORING":
        return AppointmentType.monitoring;
      case "TREATMENT":
        return AppointmentType.treatment;
      case "REJECT":
        return AppointmentType.reject;
      default:
        return null;
    }
  }
}

extension AppointmentTypeExtension on AppointmentType {
  String? get value {
    switch (this) {
      case AppointmentType.assistance:
        return "ASSISTANCE";
      case AppointmentType.monitoring:
        return "MONITORING";
      case AppointmentType.treatment:
        return "TREATMENT";
      case AppointmentType.reject:
        return "REJECT";
      case null:
        return null;
    }
  }
}
