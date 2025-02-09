// สถานะ
enum WorkFlowStatus {
  registering,
  screening,
  treatment,
  monitoring,
  assistance,
  discharged;

  String? get value {
    switch (this) {
      case WorkFlowStatus.registering:
        return "REGISTERING";
      case WorkFlowStatus.screening:
        return "SCREENING";
      case WorkFlowStatus.treatment:
        return "TREATMENT";
      case WorkFlowStatus.monitoring:
        return "MONITORING";
      case WorkFlowStatus.assistance:
        return "ASSISTANCE";
      case WorkFlowStatus.discharged:
        return "DISCHARGED";
    }
  }

  static WorkFlowStatus? setValue(String? value) {
    switch (value) {
      case "REGISTERING":
        return WorkFlowStatus.registering;
      case "SCREENING":
        return WorkFlowStatus.screening;
      case "TREATMENT":
        return WorkFlowStatus.treatment;
      case "MONITORING":
        return WorkFlowStatus.monitoring;
      case "ASSISTANCE":
        return WorkFlowStatus.assistance;
      case "DISCHARGED":
        return WorkFlowStatus.discharged;
      default:
        return null;
    }
  }
}
// ตัวกรอง ผู้ใช้ ผู้เสพ ผู้ติด

// OAS เขียว เหลือง ส้ม แดง
enum LevelType {
  normal,
  semiUrgency,
  urgency,
  emergency;

  String? get value {
    switch (this) {
      case LevelType.normal:
        return "NORMAL";
      case LevelType.semiUrgency:
        return "SEMI_URGENCY";
      case LevelType.urgency:
        return "URGENCY";
      case LevelType.emergency:
        return "EMERGENCY";
    }
  }

  static LevelType? setValue(String? value) {
    switch (value) {
      case "NORMAL":
        return LevelType.normal;
      case "SEMI_URGENCY":
        return LevelType.semiUrgency;
      case "URGENCY":
        return LevelType.urgency;
      case "EMERGENCY":
        return LevelType.emergency;
      default:
        return null;
    }
  }
}

// V2
enum DrugEvalResult {
  user,
  abuse,
  dependence;

  String? get value {
    switch (this) {
      case DrugEvalResult.user:
        return "USER";
      case DrugEvalResult.abuse:
        return "ABUSE";
      case DrugEvalResult.dependence:
        return "DEPENDENCE";
    }
  }

  static DrugEvalResult? setValue(String? value) {
    switch (value) {
      case "USER":
        return DrugEvalResult.user;
      case "ABUSE":
        return DrugEvalResult.abuse;
      case "DEPENDENCE":
        return DrugEvalResult.dependence;
      default:
        return null;
    }
  }
}

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
  other;

  String? get value {
    switch (this) {
      case TreatmentType.opd:
        return "OPD";
      case TreatmentType.ipdTreatment:
        return "IPD_TREATMENT";
      case TreatmentType.ipdRecover:
        return "IPD_RECOVER";
      case TreatmentType.ipdMini:
        return "IPD_MINI";
      case TreatmentType.cbtx:
        return "CBTX";
      case TreatmentType.network:
        return "NETWORK";
      case TreatmentType.religious:
        return "RELIGIOUS";
      case TreatmentType.rehabilitationTherapyJopc:
        return "REHABILITATION_THERAPY_JOPC";
      case TreatmentType.rehabilitationTherapyTrainingCenter:
        return "REHABILITATION_THERAPY_TRAINING_CENTER";
      case TreatmentType.wiwatSchoolProject:
        return "WIWAT_SCHOOL_PROJECT";
      case TreatmentType.programInPrisons:
        return "PROGRAM_IN_PRISONS";
      case TreatmentType.behaviorCamp:
        return "BEHAVIOR_CAMP";
      case TreatmentType.other:
        return "OTHER";
    }
  }

  static TreatmentType? setValue(String? value) {
    switch (value) {
      case "OPD":
        return TreatmentType.opd;
      case "IPD_TREATMENT":
        return TreatmentType.ipdTreatment;
      case "IPD_RECOVER":
        return TreatmentType.ipdRecover;
      case "IPD_MINI":
        return TreatmentType.ipdMini;
      case "CBTX":
        return TreatmentType.cbtx;
      case "NETWORK":
        return TreatmentType.network;
      case "RELIGIOUS":
        return TreatmentType.religious;
      case "REHABILITATION_THERAPY_JOPC":
        return TreatmentType.rehabilitationTherapyJopc;
      case "REHABILITATION_THERAPY_TRAINING_CENTER":
        return TreatmentType.rehabilitationTherapyTrainingCenter;
      case "WIWAT_SCHOOL_PROJECT":
        return TreatmentType.wiwatSchoolProject;
      case "PROGRAM_IN_PRISONS":
        return TreatmentType.programInPrisons;
      case "BEHAVIOR_CAMP":
        return TreatmentType.behaviorCamp;
      case "OTHER":
        return TreatmentType.other;
      default:
        return null;
    }
  }
}

//สถานะเพิ่มเติม
enum SmivType {
  smiv;

  String? get value {
    switch (this) {
      case SmivType.smiv:
        return "SMIV";
    }
  }

  static SmivType? setValue(String? value) {
    switch (value) {
      case "SMIV":
        return SmivType.smiv;
      default:
        return null;
    }
  }
}

enum AppointmentType {
  assistance,
  monitoring,
  treatment,
  reject;

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
    }
  }

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

enum CertificateStatus {
  request,
  completed,
  denied;

  String? get value {
    switch (this) {
      case CertificateStatus.request:
        return "REQUEST";
      case CertificateStatus.completed:
        return "COMPLETED";
      case CertificateStatus.denied:
        return "DENIED";
    }
  }

  static CertificateStatus? setValue(String? value) {
    switch (value) {
      case "REQUEST":
        return CertificateStatus.request;
      case "COMPLETED":
        return CertificateStatus.completed;
      case "DENIED":
        return CertificateStatus.denied;
      default:
        return null;
    }
  }
}
