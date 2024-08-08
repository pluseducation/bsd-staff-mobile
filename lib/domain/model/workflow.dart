import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow.freezed.dart';

@freezed
class Registering with _$Registering {
  const factory Registering({
    required String
        fullname, //** find on profile name + surname /patients/${patientId}/profile */
    required String patientStatus, //**  /patients/${nationalityText}/profile */
    required String level, //**  /patients/${patientId}/profile */
    required String dateOfBirthText, //ว/ด/ป ** '/api/v1/patients$patientsid' */
    required String gender, // เพศ* "/questionchoices$REGISTERING */
    required String nationalityText, //สัญชาติ** /master/nationalities */
    required int religionText, //ศาสนา ** /master/religions
    required String
        registereText, //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
    required String currentAddrText, //ที่อยู่ปัจจุบัน ** find on patient
    required String guardianfullNameText, //ข้อมูลผู้ปกครอง **  find on patient
    required int
        relationShipId, // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
    required String guardianPhoneNo, // เบอร์โทร 02-xxx-xxx   ** find on patient
    required String
        joinTreatmentByText, //เข้าร่วมการรักษา ** find on questionchoices
    required String joinSentByCourtText, //** find on questionchoices
  }) = _Registering;
}
