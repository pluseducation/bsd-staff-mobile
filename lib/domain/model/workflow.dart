import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow.freezed.dart';

@freezed
class Registering with _$Registering {
  const factory Registering({
    required String imagePath,
    required String
        fullname, //** find on profile name + surname /patients/${patientId}/profile */
    required String patientStatus, //**  /patients/${nationalityText}/profile */
    required String level, //**  /patients/${patientId}/profile */
    required String dateOfBirthText, //ว/ด/ป ** '/api/v1/patients$patientsid' */
    required String gender, // เพศ* "/questionchoices$REGISTERING */
    required String nationalityText, //สัญชาติ** /master/nationalities */
    required String religionText, //ศาสนา ** /master/religions
    required String
        registereText, //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
    required String currentAddrText, //ที่อยู่ปัจจุบัน ** find on patient
    required String guardianfullNameText, //ข้อมูลผู้ปกครอง **  find on patient
    required String
        relationShipText, // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
    required String guardianPhoneNo, // เบอร์โทร 02-xxx-xxx   ** find on patient
    required String
        joinTreatmentByText, //เข้าร่วมการรักษา ** find on questionchoices
    required String joinSentByCourtText, //** find on questionchoices
  }) = _Registering;
}

// --------Screening----------
@freezed
class Screening with _$Screening {
  const factory Screening({
    required String
        maritalStatusText, //** สถานะ find on  /master/${patientId} */
    required String educationText, //** การศึกษา  /master/educations */
    required String occupationText, //**อาชีพ  /master/occupations */
    required String incomeText, //**รายได้  /master/incomes */
    required String livingWithLast30days, // /screenings/${patientId} */
    required String
        parentRelationshipText, //**ความสัมพันธ์ระหว่างบิดามารดา */master/relationships
    required String startDate, // ว/ด/ป  /screenings/${patientId}
    required String
        isToBeNumberOneMember, //การใช้ยาเสพติด  /screenings/${patientId}
    required String
        drugUsageApproach, //การใช้ยาเสพติด(รูปแบบการเสพ)  /screenings/${patientId}
    required String
        mainDrugText, //ยาเสพติดที่ใช้  /master/drugs  #หมายเหตุ  answer == 17 show  other=""
    required String
        mentalEvalLevel, //** สรุปผล find on  /screenings/${patientId} */
    required int drugEvalScore,
    required String levelOfAddicted,
    required String screeningResult,
    required String
        frequencyOfUse, //** คุณใช้บ่อยเพียงใด  find on  /screenings/${patientId} */
    required String
        feelingAddicted, //** คุณมีความต้องการ หรือมีความรู้สึกอยากใช้  find on  /screenings/${patientId} */
    required String
        irresponsible, //** การใช้ ยาบ้า ทำให้คุณไม่สามารถรับผิดชอบ หรือทำกิจกรรมที่คุณเคยทำได้ตามปกติบ่อยเพียงใด  find on  /screenings/${patientId} */
    required String
        frequencyOfProblem, //** การใช้ ทำให้คุณเกิดปัญหาสุขภาพ ครอบครัว สังคม กฏหมาย หรือการเงินบ่อยเพียงใด?  find on  /screenings/${patientId} */
    required String
        beNoticed, //** ญาติ เพื่อน หรือคนรู้จัก   find on  /screenings/${patientId} */
    required String
        stopUsingButNotSuccess, //** คุนเคย find on  /screenings/${patientId} */
    required String
        injectableDrug, //** คุณเคยใช้สารเสพติดชนิดฉีดหรือไม่ /screenings/${patientId} */
    required String
        last3monthUsage, //** ภายใน 3 เดือนที่ผ่านมา คุณใช้บ่อยเพียงใด find on  /screenings/${patientId} */
    required String
        hadMentalTreatment, //**ประวัติรักษาโรคสุขภาพจิต find on  /screenings/${patientId} */
    required String
        mentalTreatmentText, //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadMentalTreatment == "YES" && show  ui เพิ่ม Text to ui  /master/mentaltreatments */
    required String
        hadChronicContagious, //**ประวัติโรคเรื้อรัง / โรคติดต่อ find on  /screenings/${patientId} */
    required String
        chronicContagiousText, //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadChronicContagious == "YES" && show  ui เพิ่ม Text to ui  /master/chroniccontagiouses */
    required String
        hadCriminalCase, //**ประวัติคดีอาญา / โรคติดต่อ find on  /screenings/${patientId} */
    required String criminalCaseText,
    required String
        homeless, //**คนเร่ร่อน ไร้ที่พักพิง find on  /screenings/${patientId} */
    required String
        disabledPerson, //**ผู้พิการ find on  /screenings/${patientId} */
    required String
        disabledCertificateNo, //**ผู้พิการ   disabledPerson == "PHYSICAL_DISABILITY" && show  ui เพิ่ม Text to ui  find on  /screenings/${patientId} */
  }) = _Screening;
}
