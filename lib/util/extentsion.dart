import 'package:bst_staff_mobile/util/enum.dart';

// patient
extension WorkFlowStatusExtension on WorkFlowStatus {
  String get value {
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
}

extension DrugEvalResultExtension on DrugEvalResult {
  String get value {
    switch (this) {
      case DrugEvalResult.user:
        return "USER";
      case DrugEvalResult.abuse:
        return "ABUSE";
      case DrugEvalResult.dependence:
        return "DEPENDENCE";
    }
  }
}

extension LevelTypeExtension on LevelType {
  String get value {
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
}

extension TreatmentTypeExtension on TreatmentType {
  String get value {
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
}

extension SmivTypeExtension on SmivType {
  String get value {
    switch (this) {
      case SmivType.smiv:
        return "SMIV";
    }
  }
}

extension AppointmentTypeExtension on AppointmentType {
  String get value {
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
}
