// สถานะ
enum WorkFlowStatus {
  registering, // ลงทะเบียน
  screening, // คัดกรอง
  treatment, // บำบัด
  monitoring, // ติดตาม
  assistance, // ช่วยเหลือ
  discharged; // จำหน่าย

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

enum LevelType {
  normal, // เขียว
  semiUrgency, // เหลือง
  urgency, // ส้ม
  emergency; // แดง

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
  user, // ผู้ใช้
  abuse, // ผู้เสพ
  dependence; // ผู้ติด

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
  opd, // ผู้ป่วยนอก (Out patient) ในสถานพยาบาล
  ipdTreatment, // ผู้ป่วยใน ระยะบำบัดในสถานพยาบาล
  ipdRecover, // ผู้ป่วยใน ระยะฟื้นฟูสมรรถภาพในสถานพยาบาล
  ipdMini, // ผู้ป่วยใน มินิธัญญารักษ์
  cbtx, // ฟื้นฟูสมรรถภาพในชุมชน (CBTx)
  network, // สถานฟื้นฟูสมรรถภาพในภาคีเครือข่าย
  religious, // ฟื้นฟูสมรรถภาพในศาสนสถาน
  rehabilitationTherapyJopc, // โปรแกรมการบำบัดฟื้นฟูฯ ในสถานพินิจและคุ้มครองเด็กและเยาวชน
  rehabilitationTherapyTrainingCenter, // โปรแกรมการบำบัดฟื้นฟูฯ ในศูนย์ฝึกและอบรมเด็กและเยาวชน
  wiwatSchoolProject, // โครงการโรงเรียนวิวัฒน์พลเมืองราชทัณฑ์
  programInPrisons, // โปรแกรมการบำบัดฟื้นฟูของกรมราชทัณฑ์ในเรือนจำ/ทัณฑสถาน
  behaviorCamp, // หลักสูตรค่ายปรับเปลี่ยนพฤติกรรม
  other; // อื่นๆ

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

enum AssistanceStatus {
  pending,
  inprogress,
  completed,
  canceled;

  String? get value {
    switch (this) {
      case AssistanceStatus.pending:
        return "PENDING";
      case AssistanceStatus.inprogress:
        return "INPROGRESS";
      case AssistanceStatus.completed:
        return "COMPLETED";
      case AssistanceStatus.canceled:
        return "CANCELED";
    }
  }

  static AssistanceStatus? setValue(String? value) {
    switch (value) {
      case "PENDING":
        return AssistanceStatus.pending;
      case "INPROGRESS":
        return AssistanceStatus.inprogress;
      case "COMPLETED":
        return AssistanceStatus.completed;
      case "CANCELED":
        return AssistanceStatus.canceled;
      default:
        return null;
    }
  }
}

enum AssistanceItemStatus {
  pending,
  inprogress,
  completed,
  exceed;

  String? get value {
    switch (this) {
      case AssistanceItemStatus.pending:
        return "PENDING";
      case AssistanceItemStatus.inprogress:
        return "INPROGRESS";
      case AssistanceItemStatus.completed:
        return "COMPLETED";
      case AssistanceItemStatus.exceed:
        return "EXCEED";
    }
  }

  static AssistanceItemStatus? setValue(String? value) {
    switch (value) {
      case "PENDING":
        return AssistanceItemStatus.pending;
      case "INPROGRESS":
        return AssistanceItemStatus.inprogress;
      case "COMPLETED":
        return AssistanceItemStatus.completed;
      case "EXCEED":
        return AssistanceItemStatus.exceed;
      default:
        return null;
    }
  }
}

enum RoundTypeStatus {
  medical,
  social;

  String? get value {
    switch (this) {
      case RoundTypeStatus.medical:
        return "MEDICAL";
      case RoundTypeStatus.social:
        return "SOCIAL";
    }
  }

  static RoundTypeStatus? setValue(String? value) {
    switch (value) {
      case "MEDICAL":
        return RoundTypeStatus.medical;
      case "SOCIAL":
        return RoundTypeStatus.social;
      default:
        return null;
    }
  }
}

enum UsingDrugStatus {
  usingDrug,
  notUsingDrug;

  String? get value {
    switch (this) {
      case UsingDrugStatus.usingDrug:
        return "USING_DRUG";
      case UsingDrugStatus.notUsingDrug:
        return "NOT_USING_DRUG";
    }
  }

  static UsingDrugStatus? setValue(String? value) {
    switch (value) {
      case "USING_DRUG":
        return UsingDrugStatus.usingDrug;
      case "NOT_USING_DRUG":
        return UsingDrugStatus.notUsingDrug;
      default:
        return null;
    }
  }
}
