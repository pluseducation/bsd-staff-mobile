enum WorkFlowStatus {
  registering,
  screening,
  treatment,
  monitoring,
  assistance,
  discharged
}

enum DrugEvalResult { user, abuse, dependence }

enum LevelType { normal, semiUrgency, urgency, emergency }

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
