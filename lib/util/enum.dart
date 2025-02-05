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

//นัดหมาย
enum AppointmentType { assistance, monitoring, treatment, reject }
