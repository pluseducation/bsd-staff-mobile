// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Registering {
  String get fullname =>
      throw _privateConstructorUsedError; //** find on profile name + surname /patients/${patientId}/profile */
  String get patientStatus =>
      throw _privateConstructorUsedError; //**  /patients/${nationalityText}/profile */
  String get level =>
      throw _privateConstructorUsedError; //**  /patients/${patientId}/profile */
  String get dateOfBirthText =>
      throw _privateConstructorUsedError; //ว/ด/ป ** '/api/v1/patients$patientsid' */
  String get gender =>
      throw _privateConstructorUsedError; // เพศ* "/questionchoices$REGISTERING */
  String get nationalityText =>
      throw _privateConstructorUsedError; //สัญชาติ** /master/nationalities */
  String get religionText =>
      throw _privateConstructorUsedError; //ศาสนา ** /master/religions
  String get registereText =>
      throw _privateConstructorUsedError; //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
  String get currentAddrText =>
      throw _privateConstructorUsedError; //ที่อยู่ปัจจุบัน ** find on patient
  String get guardianfullNameText =>
      throw _privateConstructorUsedError; //ข้อมูลผู้ปกครอง **  find on patient
  String get relationShipText =>
      throw _privateConstructorUsedError; // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
  String get guardianPhoneNo =>
      throw _privateConstructorUsedError; // เบอร์โทร 02-xxx-xxx   ** find on patient
  String get joinTreatmentByText =>
      throw _privateConstructorUsedError; //เข้าร่วมการรักษา ** find on questionchoices
  String get joinSentByCourtText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisteringCopyWith<Registering> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteringCopyWith<$Res> {
  factory $RegisteringCopyWith(
          Registering value, $Res Function(Registering) then) =
      _$RegisteringCopyWithImpl<$Res, Registering>;
  @useResult
  $Res call(
      {String fullname,
      String patientStatus,
      String level,
      String dateOfBirthText,
      String gender,
      String nationalityText,
      String religionText,
      String registereText,
      String currentAddrText,
      String guardianfullNameText,
      String relationShipText,
      String guardianPhoneNo,
      String joinTreatmentByText,
      String joinSentByCourtText});
}

/// @nodoc
class _$RegisteringCopyWithImpl<$Res, $Val extends Registering>
    implements $RegisteringCopyWith<$Res> {
  _$RegisteringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? patientStatus = null,
    Object? level = null,
    Object? dateOfBirthText = null,
    Object? gender = null,
    Object? nationalityText = null,
    Object? religionText = null,
    Object? registereText = null,
    Object? currentAddrText = null,
    Object? guardianfullNameText = null,
    Object? relationShipText = null,
    Object? guardianPhoneNo = null,
    Object? joinTreatmentByText = null,
    Object? joinSentByCourtText = null,
  }) {
    return _then(_value.copyWith(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      patientStatus: null == patientStatus
          ? _value.patientStatus
          : patientStatus // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirthText: null == dateOfBirthText
          ? _value.dateOfBirthText
          : dateOfBirthText // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityText: null == nationalityText
          ? _value.nationalityText
          : nationalityText // ignore: cast_nullable_to_non_nullable
              as String,
      religionText: null == religionText
          ? _value.religionText
          : religionText // ignore: cast_nullable_to_non_nullable
              as String,
      registereText: null == registereText
          ? _value.registereText
          : registereText // ignore: cast_nullable_to_non_nullable
              as String,
      currentAddrText: null == currentAddrText
          ? _value.currentAddrText
          : currentAddrText // ignore: cast_nullable_to_non_nullable
              as String,
      guardianfullNameText: null == guardianfullNameText
          ? _value.guardianfullNameText
          : guardianfullNameText // ignore: cast_nullable_to_non_nullable
              as String,
      relationShipText: null == relationShipText
          ? _value.relationShipText
          : relationShipText // ignore: cast_nullable_to_non_nullable
              as String,
      guardianPhoneNo: null == guardianPhoneNo
          ? _value.guardianPhoneNo
          : guardianPhoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      joinTreatmentByText: null == joinTreatmentByText
          ? _value.joinTreatmentByText
          : joinTreatmentByText // ignore: cast_nullable_to_non_nullable
              as String,
      joinSentByCourtText: null == joinSentByCourtText
          ? _value.joinSentByCourtText
          : joinSentByCourtText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisteringImplCopyWith<$Res>
    implements $RegisteringCopyWith<$Res> {
  factory _$$RegisteringImplCopyWith(
          _$RegisteringImpl value, $Res Function(_$RegisteringImpl) then) =
      __$$RegisteringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullname,
      String patientStatus,
      String level,
      String dateOfBirthText,
      String gender,
      String nationalityText,
      String religionText,
      String registereText,
      String currentAddrText,
      String guardianfullNameText,
      String relationShipText,
      String guardianPhoneNo,
      String joinTreatmentByText,
      String joinSentByCourtText});
}

/// @nodoc
class __$$RegisteringImplCopyWithImpl<$Res>
    extends _$RegisteringCopyWithImpl<$Res, _$RegisteringImpl>
    implements _$$RegisteringImplCopyWith<$Res> {
  __$$RegisteringImplCopyWithImpl(
      _$RegisteringImpl _value, $Res Function(_$RegisteringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? patientStatus = null,
    Object? level = null,
    Object? dateOfBirthText = null,
    Object? gender = null,
    Object? nationalityText = null,
    Object? religionText = null,
    Object? registereText = null,
    Object? currentAddrText = null,
    Object? guardianfullNameText = null,
    Object? relationShipText = null,
    Object? guardianPhoneNo = null,
    Object? joinTreatmentByText = null,
    Object? joinSentByCourtText = null,
  }) {
    return _then(_$RegisteringImpl(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      patientStatus: null == patientStatus
          ? _value.patientStatus
          : patientStatus // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirthText: null == dateOfBirthText
          ? _value.dateOfBirthText
          : dateOfBirthText // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityText: null == nationalityText
          ? _value.nationalityText
          : nationalityText // ignore: cast_nullable_to_non_nullable
              as String,
      religionText: null == religionText
          ? _value.religionText
          : religionText // ignore: cast_nullable_to_non_nullable
              as String,
      registereText: null == registereText
          ? _value.registereText
          : registereText // ignore: cast_nullable_to_non_nullable
              as String,
      currentAddrText: null == currentAddrText
          ? _value.currentAddrText
          : currentAddrText // ignore: cast_nullable_to_non_nullable
              as String,
      guardianfullNameText: null == guardianfullNameText
          ? _value.guardianfullNameText
          : guardianfullNameText // ignore: cast_nullable_to_non_nullable
              as String,
      relationShipText: null == relationShipText
          ? _value.relationShipText
          : relationShipText // ignore: cast_nullable_to_non_nullable
              as String,
      guardianPhoneNo: null == guardianPhoneNo
          ? _value.guardianPhoneNo
          : guardianPhoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      joinTreatmentByText: null == joinTreatmentByText
          ? _value.joinTreatmentByText
          : joinTreatmentByText // ignore: cast_nullable_to_non_nullable
              as String,
      joinSentByCourtText: null == joinSentByCourtText
          ? _value.joinSentByCourtText
          : joinSentByCourtText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisteringImpl implements _Registering {
  const _$RegisteringImpl(
      {required this.fullname,
      required this.patientStatus,
      required this.level,
      required this.dateOfBirthText,
      required this.gender,
      required this.nationalityText,
      required this.religionText,
      required this.registereText,
      required this.currentAddrText,
      required this.guardianfullNameText,
      required this.relationShipText,
      required this.guardianPhoneNo,
      required this.joinTreatmentByText,
      required this.joinSentByCourtText});

  @override
  final String fullname;
//** find on profile name + surname /patients/${patientId}/profile */
  @override
  final String patientStatus;
//**  /patients/${nationalityText}/profile */
  @override
  final String level;
//**  /patients/${patientId}/profile */
  @override
  final String dateOfBirthText;
//ว/ด/ป ** '/api/v1/patients$patientsid' */
  @override
  final String gender;
// เพศ* "/questionchoices$REGISTERING */
  @override
  final String nationalityText;
//สัญชาติ** /master/nationalities */
  @override
  final String religionText;
//ศาสนา ** /master/religions
  @override
  final String registereText;
//  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
  @override
  final String currentAddrText;
//ที่อยู่ปัจจุบัน ** find on patient
  @override
  final String guardianfullNameText;
//ข้อมูลผู้ปกครอง **  find on patient
  @override
  final String relationShipText;
// ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
  @override
  final String guardianPhoneNo;
// เบอร์โทร 02-xxx-xxx   ** find on patient
  @override
  final String joinTreatmentByText;
//เข้าร่วมการรักษา ** find on questionchoices
  @override
  final String joinSentByCourtText;

  @override
  String toString() {
    return 'Registering(fullname: $fullname, patientStatus: $patientStatus, level: $level, dateOfBirthText: $dateOfBirthText, gender: $gender, nationalityText: $nationalityText, religionText: $religionText, registereText: $registereText, currentAddrText: $currentAddrText, guardianfullNameText: $guardianfullNameText, relationShipText: $relationShipText, guardianPhoneNo: $guardianPhoneNo, joinTreatmentByText: $joinTreatmentByText, joinSentByCourtText: $joinSentByCourtText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisteringImpl &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.patientStatus, patientStatus) ||
                other.patientStatus == patientStatus) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.dateOfBirthText, dateOfBirthText) ||
                other.dateOfBirthText == dateOfBirthText) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationalityText, nationalityText) ||
                other.nationalityText == nationalityText) &&
            (identical(other.religionText, religionText) ||
                other.religionText == religionText) &&
            (identical(other.registereText, registereText) ||
                other.registereText == registereText) &&
            (identical(other.currentAddrText, currentAddrText) ||
                other.currentAddrText == currentAddrText) &&
            (identical(other.guardianfullNameText, guardianfullNameText) ||
                other.guardianfullNameText == guardianfullNameText) &&
            (identical(other.relationShipText, relationShipText) ||
                other.relationShipText == relationShipText) &&
            (identical(other.guardianPhoneNo, guardianPhoneNo) ||
                other.guardianPhoneNo == guardianPhoneNo) &&
            (identical(other.joinTreatmentByText, joinTreatmentByText) ||
                other.joinTreatmentByText == joinTreatmentByText) &&
            (identical(other.joinSentByCourtText, joinSentByCourtText) ||
                other.joinSentByCourtText == joinSentByCourtText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullname,
      patientStatus,
      level,
      dateOfBirthText,
      gender,
      nationalityText,
      religionText,
      registereText,
      currentAddrText,
      guardianfullNameText,
      relationShipText,
      guardianPhoneNo,
      joinTreatmentByText,
      joinSentByCourtText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisteringImplCopyWith<_$RegisteringImpl> get copyWith =>
      __$$RegisteringImplCopyWithImpl<_$RegisteringImpl>(this, _$identity);
}

abstract class _Registering implements Registering {
  const factory _Registering(
      {required final String fullname,
      required final String patientStatus,
      required final String level,
      required final String dateOfBirthText,
      required final String gender,
      required final String nationalityText,
      required final String religionText,
      required final String registereText,
      required final String currentAddrText,
      required final String guardianfullNameText,
      required final String relationShipText,
      required final String guardianPhoneNo,
      required final String joinTreatmentByText,
      required final String joinSentByCourtText}) = _$RegisteringImpl;

  @override
  String get fullname;
  @override //** find on profile name + surname /patients/${patientId}/profile */
  String get patientStatus;
  @override //**  /patients/${nationalityText}/profile */
  String get level;
  @override //**  /patients/${patientId}/profile */
  String get dateOfBirthText;
  @override //ว/ด/ป ** '/api/v1/patients$patientsid' */
  String get gender;
  @override // เพศ* "/questionchoices$REGISTERING */
  String get nationalityText;
  @override //สัญชาติ** /master/nationalities */
  String get religionText;
  @override //ศาสนา ** /master/religions
  String get registereText;
  @override //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
  String get currentAddrText;
  @override //ที่อยู่ปัจจุบัน ** find on patient
  String get guardianfullNameText;
  @override //ข้อมูลผู้ปกครอง **  find on patient
  String get relationShipText;
  @override // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
  String get guardianPhoneNo;
  @override // เบอร์โทร 02-xxx-xxx   ** find on patient
  String get joinTreatmentByText;
  @override //เข้าร่วมการรักษา ** find on questionchoices
  String get joinSentByCourtText;
  @override
  @JsonKey(ignore: true)
  _$$RegisteringImplCopyWith<_$RegisteringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Screening {
  int get maritalStatusId =>
      throw _privateConstructorUsedError; //** สถานะ find on  /master/${patientId} */
  int get educationId =>
      throw _privateConstructorUsedError; //** การศึกษา  /master/educations */
  int get occupationId =>
      throw _privateConstructorUsedError; //**อาชีพ  /master/occupations */
  int get incomeId =>
      throw _privateConstructorUsedError; //**รายได้  /master/incomes */
  String get livingWithLast30days =>
      throw _privateConstructorUsedError; // /screenings/${patientId} */
  int get parentRelationshipId =>
      throw _privateConstructorUsedError; //**ความสัมพันธ์ระหว่างบิดามารดา */master/relationships
  String get startDate =>
      throw _privateConstructorUsedError; // ว/ด/ป  /screenings/${patientId}
  String get isToBeNumberOneMember =>
      throw _privateConstructorUsedError; //การใช้ยาเสพติด  /screenings/${patientId}
  String get drugUsageApproach =>
      throw _privateConstructorUsedError; //การใช้ยาเสพติด(รูปแบบการเสพ)  /screenings/${patientId}
  String get mainDrugText =>
      throw _privateConstructorUsedError; //ยาเสพติดที่ใช้  /master/drugs  #หมายเหตุ  answer == 17 show  other=""
  String get mentalEvalLevel =>
      throw _privateConstructorUsedError; //** สรุปผล find on  /screenings/${patientId} */
  String get frequencyOfUse =>
      throw _privateConstructorUsedError; //** คุณใช้บ่อยเพียงใด  find on  /screenings/${patientId} */
  String get feelingAddicted =>
      throw _privateConstructorUsedError; //** คุณมีความต้องการ หรือมีความรู้สึกอยากใช้  find on  /screenings/${patientId} */
  String get irresponsible =>
      throw _privateConstructorUsedError; //** การใช้ ยาบ้า ทำให้คุณไม่สามารถรับผิดชอบ หรือทำกิจกรรมที่คุณเคยทำได้ตามปกติบ่อยเพียงใด  find on  /screenings/${patientId} */
  String get frequencyOfProblem =>
      throw _privateConstructorUsedError; //** การใช้ ทำให้คุณเกิดปัญหาสุขภาพ ครอบครัว สังคม กฏหมาย หรือการเงินบ่อยเพียงใด?  find on  /screenings/${patientId} */
  String get beNoticed =>
      throw _privateConstructorUsedError; //** ญาติ เพื่อน หรือคนรู้จัก   find on  /screenings/${patientId} */
  String get stopUsingButNotSuccess =>
      throw _privateConstructorUsedError; //** คุนเคย find on  /screenings/${patientId} */
  String get injectableDrug =>
      throw _privateConstructorUsedError; //** คุณเคยใช้สารเสพติดชนิดฉีดหรือไม่ /screenings/${patientId} */
  String get last3monthUsage =>
      throw _privateConstructorUsedError; //** ภายใน 3 เดือนที่ผ่านมา คุณใช้บ่อยเพียงใด find on  /screenings/${patientId} */
  String get hadMentalTreatment =>
      throw _privateConstructorUsedError; //**ประวัติรักษาโรคสุขภาพจิต find on  /screenings/${patientId} */
  int get mentalTreatmentText =>
      throw _privateConstructorUsedError; //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadMentalTreatment == "YES" && show  ui เพิ่ม Text to ui  /master/mentaltreatments */
  String get hadChronicContagious =>
      throw _privateConstructorUsedError; //**ประวัติโรคเรื้อรัง / โรคติดต่อ find on  /screenings/${patientId} */
  int get chronicContagiousId => throw _privateConstructorUsedError;
  int get chronicContagiousText =>
      throw _privateConstructorUsedError; //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadChronicContagious == "YES" && show  ui เพิ่ม Text to ui  /master/chroniccontagiouses */
  String get hadCriminalCase =>
      throw _privateConstructorUsedError; //**ประวัติคดีอาญา / โรคติดต่อ find on  /screenings/${patientId} */
//----------
  int get criminalCaseIdText => throw _privateConstructorUsedError; //-------
  int get criminalCaseText =>
      throw _privateConstructorUsedError; //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadCriminalCase == "YES" && show  ui เพิ่ม Text to ui  /master/criminalcases */
  String get homeless =>
      throw _privateConstructorUsedError; //**คนเร่ร่อน ไร้ที่พักพิง find on  /screenings/${patientId} */
  String get disabledPerson =>
      throw _privateConstructorUsedError; //**ผู้พิการ find on  /screenings/${patientId} */
  String get disabledCertificateNo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScreeningCopyWith<Screening> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningCopyWith<$Res> {
  factory $ScreeningCopyWith(Screening value, $Res Function(Screening) then) =
      _$ScreeningCopyWithImpl<$Res, Screening>;
  @useResult
  $Res call(
      {int maritalStatusId,
      int educationId,
      int occupationId,
      int incomeId,
      String livingWithLast30days,
      int parentRelationshipId,
      String startDate,
      String isToBeNumberOneMember,
      String drugUsageApproach,
      String mainDrugText,
      String mentalEvalLevel,
      String frequencyOfUse,
      String feelingAddicted,
      String irresponsible,
      String frequencyOfProblem,
      String beNoticed,
      String stopUsingButNotSuccess,
      String injectableDrug,
      String last3monthUsage,
      String hadMentalTreatment,
      int mentalTreatmentText,
      String hadChronicContagious,
      int chronicContagiousId,
      int chronicContagiousText,
      String hadCriminalCase,
      int criminalCaseIdText,
      int criminalCaseText,
      String homeless,
      String disabledPerson,
      String disabledCertificateNo});
}

/// @nodoc
class _$ScreeningCopyWithImpl<$Res, $Val extends Screening>
    implements $ScreeningCopyWith<$Res> {
  _$ScreeningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maritalStatusId = null,
    Object? educationId = null,
    Object? occupationId = null,
    Object? incomeId = null,
    Object? livingWithLast30days = null,
    Object? parentRelationshipId = null,
    Object? startDate = null,
    Object? isToBeNumberOneMember = null,
    Object? drugUsageApproach = null,
    Object? mainDrugText = null,
    Object? mentalEvalLevel = null,
    Object? frequencyOfUse = null,
    Object? feelingAddicted = null,
    Object? irresponsible = null,
    Object? frequencyOfProblem = null,
    Object? beNoticed = null,
    Object? stopUsingButNotSuccess = null,
    Object? injectableDrug = null,
    Object? last3monthUsage = null,
    Object? hadMentalTreatment = null,
    Object? mentalTreatmentText = null,
    Object? hadChronicContagious = null,
    Object? chronicContagiousId = null,
    Object? chronicContagiousText = null,
    Object? hadCriminalCase = null,
    Object? criminalCaseIdText = null,
    Object? criminalCaseText = null,
    Object? homeless = null,
    Object? disabledPerson = null,
    Object? disabledCertificateNo = null,
  }) {
    return _then(_value.copyWith(
      maritalStatusId: null == maritalStatusId
          ? _value.maritalStatusId
          : maritalStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      educationId: null == educationId
          ? _value.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int,
      occupationId: null == occupationId
          ? _value.occupationId
          : occupationId // ignore: cast_nullable_to_non_nullable
              as int,
      incomeId: null == incomeId
          ? _value.incomeId
          : incomeId // ignore: cast_nullable_to_non_nullable
              as int,
      livingWithLast30days: null == livingWithLast30days
          ? _value.livingWithLast30days
          : livingWithLast30days // ignore: cast_nullable_to_non_nullable
              as String,
      parentRelationshipId: null == parentRelationshipId
          ? _value.parentRelationshipId
          : parentRelationshipId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isToBeNumberOneMember: null == isToBeNumberOneMember
          ? _value.isToBeNumberOneMember
          : isToBeNumberOneMember // ignore: cast_nullable_to_non_nullable
              as String,
      drugUsageApproach: null == drugUsageApproach
          ? _value.drugUsageApproach
          : drugUsageApproach // ignore: cast_nullable_to_non_nullable
              as String,
      mainDrugText: null == mainDrugText
          ? _value.mainDrugText
          : mainDrugText // ignore: cast_nullable_to_non_nullable
              as String,
      mentalEvalLevel: null == mentalEvalLevel
          ? _value.mentalEvalLevel
          : mentalEvalLevel // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyOfUse: null == frequencyOfUse
          ? _value.frequencyOfUse
          : frequencyOfUse // ignore: cast_nullable_to_non_nullable
              as String,
      feelingAddicted: null == feelingAddicted
          ? _value.feelingAddicted
          : feelingAddicted // ignore: cast_nullable_to_non_nullable
              as String,
      irresponsible: null == irresponsible
          ? _value.irresponsible
          : irresponsible // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyOfProblem: null == frequencyOfProblem
          ? _value.frequencyOfProblem
          : frequencyOfProblem // ignore: cast_nullable_to_non_nullable
              as String,
      beNoticed: null == beNoticed
          ? _value.beNoticed
          : beNoticed // ignore: cast_nullable_to_non_nullable
              as String,
      stopUsingButNotSuccess: null == stopUsingButNotSuccess
          ? _value.stopUsingButNotSuccess
          : stopUsingButNotSuccess // ignore: cast_nullable_to_non_nullable
              as String,
      injectableDrug: null == injectableDrug
          ? _value.injectableDrug
          : injectableDrug // ignore: cast_nullable_to_non_nullable
              as String,
      last3monthUsage: null == last3monthUsage
          ? _value.last3monthUsage
          : last3monthUsage // ignore: cast_nullable_to_non_nullable
              as String,
      hadMentalTreatment: null == hadMentalTreatment
          ? _value.hadMentalTreatment
          : hadMentalTreatment // ignore: cast_nullable_to_non_nullable
              as String,
      mentalTreatmentText: null == mentalTreatmentText
          ? _value.mentalTreatmentText
          : mentalTreatmentText // ignore: cast_nullable_to_non_nullable
              as int,
      hadChronicContagious: null == hadChronicContagious
          ? _value.hadChronicContagious
          : hadChronicContagious // ignore: cast_nullable_to_non_nullable
              as String,
      chronicContagiousId: null == chronicContagiousId
          ? _value.chronicContagiousId
          : chronicContagiousId // ignore: cast_nullable_to_non_nullable
              as int,
      chronicContagiousText: null == chronicContagiousText
          ? _value.chronicContagiousText
          : chronicContagiousText // ignore: cast_nullable_to_non_nullable
              as int,
      hadCriminalCase: null == hadCriminalCase
          ? _value.hadCriminalCase
          : hadCriminalCase // ignore: cast_nullable_to_non_nullable
              as String,
      criminalCaseIdText: null == criminalCaseIdText
          ? _value.criminalCaseIdText
          : criminalCaseIdText // ignore: cast_nullable_to_non_nullable
              as int,
      criminalCaseText: null == criminalCaseText
          ? _value.criminalCaseText
          : criminalCaseText // ignore: cast_nullable_to_non_nullable
              as int,
      homeless: null == homeless
          ? _value.homeless
          : homeless // ignore: cast_nullable_to_non_nullable
              as String,
      disabledPerson: null == disabledPerson
          ? _value.disabledPerson
          : disabledPerson // ignore: cast_nullable_to_non_nullable
              as String,
      disabledCertificateNo: null == disabledCertificateNo
          ? _value.disabledCertificateNo
          : disabledCertificateNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreeningImplCopyWith<$Res>
    implements $ScreeningCopyWith<$Res> {
  factory _$$ScreeningImplCopyWith(
          _$ScreeningImpl value, $Res Function(_$ScreeningImpl) then) =
      __$$ScreeningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int maritalStatusId,
      int educationId,
      int occupationId,
      int incomeId,
      String livingWithLast30days,
      int parentRelationshipId,
      String startDate,
      String isToBeNumberOneMember,
      String drugUsageApproach,
      String mainDrugText,
      String mentalEvalLevel,
      String frequencyOfUse,
      String feelingAddicted,
      String irresponsible,
      String frequencyOfProblem,
      String beNoticed,
      String stopUsingButNotSuccess,
      String injectableDrug,
      String last3monthUsage,
      String hadMentalTreatment,
      int mentalTreatmentText,
      String hadChronicContagious,
      int chronicContagiousId,
      int chronicContagiousText,
      String hadCriminalCase,
      int criminalCaseIdText,
      int criminalCaseText,
      String homeless,
      String disabledPerson,
      String disabledCertificateNo});
}

/// @nodoc
class __$$ScreeningImplCopyWithImpl<$Res>
    extends _$ScreeningCopyWithImpl<$Res, _$ScreeningImpl>
    implements _$$ScreeningImplCopyWith<$Res> {
  __$$ScreeningImplCopyWithImpl(
      _$ScreeningImpl _value, $Res Function(_$ScreeningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maritalStatusId = null,
    Object? educationId = null,
    Object? occupationId = null,
    Object? incomeId = null,
    Object? livingWithLast30days = null,
    Object? parentRelationshipId = null,
    Object? startDate = null,
    Object? isToBeNumberOneMember = null,
    Object? drugUsageApproach = null,
    Object? mainDrugText = null,
    Object? mentalEvalLevel = null,
    Object? frequencyOfUse = null,
    Object? feelingAddicted = null,
    Object? irresponsible = null,
    Object? frequencyOfProblem = null,
    Object? beNoticed = null,
    Object? stopUsingButNotSuccess = null,
    Object? injectableDrug = null,
    Object? last3monthUsage = null,
    Object? hadMentalTreatment = null,
    Object? mentalTreatmentText = null,
    Object? hadChronicContagious = null,
    Object? chronicContagiousId = null,
    Object? chronicContagiousText = null,
    Object? hadCriminalCase = null,
    Object? criminalCaseIdText = null,
    Object? criminalCaseText = null,
    Object? homeless = null,
    Object? disabledPerson = null,
    Object? disabledCertificateNo = null,
  }) {
    return _then(_$ScreeningImpl(
      maritalStatusId: null == maritalStatusId
          ? _value.maritalStatusId
          : maritalStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      educationId: null == educationId
          ? _value.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int,
      occupationId: null == occupationId
          ? _value.occupationId
          : occupationId // ignore: cast_nullable_to_non_nullable
              as int,
      incomeId: null == incomeId
          ? _value.incomeId
          : incomeId // ignore: cast_nullable_to_non_nullable
              as int,
      livingWithLast30days: null == livingWithLast30days
          ? _value.livingWithLast30days
          : livingWithLast30days // ignore: cast_nullable_to_non_nullable
              as String,
      parentRelationshipId: null == parentRelationshipId
          ? _value.parentRelationshipId
          : parentRelationshipId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isToBeNumberOneMember: null == isToBeNumberOneMember
          ? _value.isToBeNumberOneMember
          : isToBeNumberOneMember // ignore: cast_nullable_to_non_nullable
              as String,
      drugUsageApproach: null == drugUsageApproach
          ? _value.drugUsageApproach
          : drugUsageApproach // ignore: cast_nullable_to_non_nullable
              as String,
      mainDrugText: null == mainDrugText
          ? _value.mainDrugText
          : mainDrugText // ignore: cast_nullable_to_non_nullable
              as String,
      mentalEvalLevel: null == mentalEvalLevel
          ? _value.mentalEvalLevel
          : mentalEvalLevel // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyOfUse: null == frequencyOfUse
          ? _value.frequencyOfUse
          : frequencyOfUse // ignore: cast_nullable_to_non_nullable
              as String,
      feelingAddicted: null == feelingAddicted
          ? _value.feelingAddicted
          : feelingAddicted // ignore: cast_nullable_to_non_nullable
              as String,
      irresponsible: null == irresponsible
          ? _value.irresponsible
          : irresponsible // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyOfProblem: null == frequencyOfProblem
          ? _value.frequencyOfProblem
          : frequencyOfProblem // ignore: cast_nullable_to_non_nullable
              as String,
      beNoticed: null == beNoticed
          ? _value.beNoticed
          : beNoticed // ignore: cast_nullable_to_non_nullable
              as String,
      stopUsingButNotSuccess: null == stopUsingButNotSuccess
          ? _value.stopUsingButNotSuccess
          : stopUsingButNotSuccess // ignore: cast_nullable_to_non_nullable
              as String,
      injectableDrug: null == injectableDrug
          ? _value.injectableDrug
          : injectableDrug // ignore: cast_nullable_to_non_nullable
              as String,
      last3monthUsage: null == last3monthUsage
          ? _value.last3monthUsage
          : last3monthUsage // ignore: cast_nullable_to_non_nullable
              as String,
      hadMentalTreatment: null == hadMentalTreatment
          ? _value.hadMentalTreatment
          : hadMentalTreatment // ignore: cast_nullable_to_non_nullable
              as String,
      mentalTreatmentText: null == mentalTreatmentText
          ? _value.mentalTreatmentText
          : mentalTreatmentText // ignore: cast_nullable_to_non_nullable
              as int,
      hadChronicContagious: null == hadChronicContagious
          ? _value.hadChronicContagious
          : hadChronicContagious // ignore: cast_nullable_to_non_nullable
              as String,
      chronicContagiousId: null == chronicContagiousId
          ? _value.chronicContagiousId
          : chronicContagiousId // ignore: cast_nullable_to_non_nullable
              as int,
      chronicContagiousText: null == chronicContagiousText
          ? _value.chronicContagiousText
          : chronicContagiousText // ignore: cast_nullable_to_non_nullable
              as int,
      hadCriminalCase: null == hadCriminalCase
          ? _value.hadCriminalCase
          : hadCriminalCase // ignore: cast_nullable_to_non_nullable
              as String,
      criminalCaseIdText: null == criminalCaseIdText
          ? _value.criminalCaseIdText
          : criminalCaseIdText // ignore: cast_nullable_to_non_nullable
              as int,
      criminalCaseText: null == criminalCaseText
          ? _value.criminalCaseText
          : criminalCaseText // ignore: cast_nullable_to_non_nullable
              as int,
      homeless: null == homeless
          ? _value.homeless
          : homeless // ignore: cast_nullable_to_non_nullable
              as String,
      disabledPerson: null == disabledPerson
          ? _value.disabledPerson
          : disabledPerson // ignore: cast_nullable_to_non_nullable
              as String,
      disabledCertificateNo: null == disabledCertificateNo
          ? _value.disabledCertificateNo
          : disabledCertificateNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScreeningImpl implements _Screening {
  const _$ScreeningImpl(
      {required this.maritalStatusId,
      required this.educationId,
      required this.occupationId,
      required this.incomeId,
      required this.livingWithLast30days,
      required this.parentRelationshipId,
      required this.startDate,
      required this.isToBeNumberOneMember,
      required this.drugUsageApproach,
      required this.mainDrugText,
      required this.mentalEvalLevel,
      required this.frequencyOfUse,
      required this.feelingAddicted,
      required this.irresponsible,
      required this.frequencyOfProblem,
      required this.beNoticed,
      required this.stopUsingButNotSuccess,
      required this.injectableDrug,
      required this.last3monthUsage,
      required this.hadMentalTreatment,
      required this.mentalTreatmentText,
      required this.hadChronicContagious,
      required this.chronicContagiousId,
      required this.chronicContagiousText,
      required this.hadCriminalCase,
      required this.criminalCaseIdText,
      required this.criminalCaseText,
      required this.homeless,
      required this.disabledPerson,
      required this.disabledCertificateNo});

  @override
  final int maritalStatusId;
//** สถานะ find on  /master/${patientId} */
  @override
  final int educationId;
//** การศึกษา  /master/educations */
  @override
  final int occupationId;
//**อาชีพ  /master/occupations */
  @override
  final int incomeId;
//**รายได้  /master/incomes */
  @override
  final String livingWithLast30days;
// /screenings/${patientId} */
  @override
  final int parentRelationshipId;
//**ความสัมพันธ์ระหว่างบิดามารดา */master/relationships
  @override
  final String startDate;
// ว/ด/ป  /screenings/${patientId}
  @override
  final String isToBeNumberOneMember;
//การใช้ยาเสพติด  /screenings/${patientId}
  @override
  final String drugUsageApproach;
//การใช้ยาเสพติด(รูปแบบการเสพ)  /screenings/${patientId}
  @override
  final String mainDrugText;
//ยาเสพติดที่ใช้  /master/drugs  #หมายเหตุ  answer == 17 show  other=""
  @override
  final String mentalEvalLevel;
//** สรุปผล find on  /screenings/${patientId} */
  @override
  final String frequencyOfUse;
//** คุณใช้บ่อยเพียงใด  find on  /screenings/${patientId} */
  @override
  final String feelingAddicted;
//** คุณมีความต้องการ หรือมีความรู้สึกอยากใช้  find on  /screenings/${patientId} */
  @override
  final String irresponsible;
//** การใช้ ยาบ้า ทำให้คุณไม่สามารถรับผิดชอบ หรือทำกิจกรรมที่คุณเคยทำได้ตามปกติบ่อยเพียงใด  find on  /screenings/${patientId} */
  @override
  final String frequencyOfProblem;
//** การใช้ ทำให้คุณเกิดปัญหาสุขภาพ ครอบครัว สังคม กฏหมาย หรือการเงินบ่อยเพียงใด?  find on  /screenings/${patientId} */
  @override
  final String beNoticed;
//** ญาติ เพื่อน หรือคนรู้จัก   find on  /screenings/${patientId} */
  @override
  final String stopUsingButNotSuccess;
//** คุนเคย find on  /screenings/${patientId} */
  @override
  final String injectableDrug;
//** คุณเคยใช้สารเสพติดชนิดฉีดหรือไม่ /screenings/${patientId} */
  @override
  final String last3monthUsage;
//** ภายใน 3 เดือนที่ผ่านมา คุณใช้บ่อยเพียงใด find on  /screenings/${patientId} */
  @override
  final String hadMentalTreatment;
//**ประวัติรักษาโรคสุขภาพจิต find on  /screenings/${patientId} */
  @override
  final int mentalTreatmentText;
//**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadMentalTreatment == "YES" && show  ui เพิ่ม Text to ui  /master/mentaltreatments */
  @override
  final String hadChronicContagious;
//**ประวัติโรคเรื้อรัง / โรคติดต่อ find on  /screenings/${patientId} */
  @override
  final int chronicContagiousId;
  @override
  final int chronicContagiousText;
//**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadChronicContagious == "YES" && show  ui เพิ่ม Text to ui  /master/chroniccontagiouses */
  @override
  final String hadCriminalCase;
//**ประวัติคดีอาญา / โรคติดต่อ find on  /screenings/${patientId} */
//----------
  @override
  final int criminalCaseIdText;
//-------
  @override
  final int criminalCaseText;
//**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadCriminalCase == "YES" && show  ui เพิ่ม Text to ui  /master/criminalcases */
  @override
  final String homeless;
//**คนเร่ร่อน ไร้ที่พักพิง find on  /screenings/${patientId} */
  @override
  final String disabledPerson;
//**ผู้พิการ find on  /screenings/${patientId} */
  @override
  final String disabledCertificateNo;

  @override
  String toString() {
    return 'Screening(maritalStatusId: $maritalStatusId, educationId: $educationId, occupationId: $occupationId, incomeId: $incomeId, livingWithLast30days: $livingWithLast30days, parentRelationshipId: $parentRelationshipId, startDate: $startDate, isToBeNumberOneMember: $isToBeNumberOneMember, drugUsageApproach: $drugUsageApproach, mainDrugText: $mainDrugText, mentalEvalLevel: $mentalEvalLevel, frequencyOfUse: $frequencyOfUse, feelingAddicted: $feelingAddicted, irresponsible: $irresponsible, frequencyOfProblem: $frequencyOfProblem, beNoticed: $beNoticed, stopUsingButNotSuccess: $stopUsingButNotSuccess, injectableDrug: $injectableDrug, last3monthUsage: $last3monthUsage, hadMentalTreatment: $hadMentalTreatment, mentalTreatmentText: $mentalTreatmentText, hadChronicContagious: $hadChronicContagious, chronicContagiousId: $chronicContagiousId, chronicContagiousText: $chronicContagiousText, hadCriminalCase: $hadCriminalCase, criminalCaseIdText: $criminalCaseIdText, criminalCaseText: $criminalCaseText, homeless: $homeless, disabledPerson: $disabledPerson, disabledCertificateNo: $disabledCertificateNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningImpl &&
            (identical(other.maritalStatusId, maritalStatusId) ||
                other.maritalStatusId == maritalStatusId) &&
            (identical(other.educationId, educationId) ||
                other.educationId == educationId) &&
            (identical(other.occupationId, occupationId) ||
                other.occupationId == occupationId) &&
            (identical(other.incomeId, incomeId) ||
                other.incomeId == incomeId) &&
            (identical(other.livingWithLast30days, livingWithLast30days) ||
                other.livingWithLast30days == livingWithLast30days) &&
            (identical(other.parentRelationshipId, parentRelationshipId) ||
                other.parentRelationshipId == parentRelationshipId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.isToBeNumberOneMember, isToBeNumberOneMember) ||
                other.isToBeNumberOneMember == isToBeNumberOneMember) &&
            (identical(other.drugUsageApproach, drugUsageApproach) ||
                other.drugUsageApproach == drugUsageApproach) &&
            (identical(other.mainDrugText, mainDrugText) ||
                other.mainDrugText == mainDrugText) &&
            (identical(other.mentalEvalLevel, mentalEvalLevel) ||
                other.mentalEvalLevel == mentalEvalLevel) &&
            (identical(other.frequencyOfUse, frequencyOfUse) ||
                other.frequencyOfUse == frequencyOfUse) &&
            (identical(other.feelingAddicted, feelingAddicted) ||
                other.feelingAddicted == feelingAddicted) &&
            (identical(other.irresponsible, irresponsible) ||
                other.irresponsible == irresponsible) &&
            (identical(other.frequencyOfProblem, frequencyOfProblem) ||
                other.frequencyOfProblem == frequencyOfProblem) &&
            (identical(other.beNoticed, beNoticed) ||
                other.beNoticed == beNoticed) &&
            (identical(other.stopUsingButNotSuccess, stopUsingButNotSuccess) ||
                other.stopUsingButNotSuccess == stopUsingButNotSuccess) &&
            (identical(other.injectableDrug, injectableDrug) ||
                other.injectableDrug == injectableDrug) &&
            (identical(other.last3monthUsage, last3monthUsage) ||
                other.last3monthUsage == last3monthUsage) &&
            (identical(other.hadMentalTreatment, hadMentalTreatment) ||
                other.hadMentalTreatment == hadMentalTreatment) &&
            (identical(other.mentalTreatmentText, mentalTreatmentText) ||
                other.mentalTreatmentText == mentalTreatmentText) &&
            (identical(other.hadChronicContagious, hadChronicContagious) ||
                other.hadChronicContagious == hadChronicContagious) &&
            (identical(other.chronicContagiousId, chronicContagiousId) ||
                other.chronicContagiousId == chronicContagiousId) &&
            (identical(other.chronicContagiousText, chronicContagiousText) ||
                other.chronicContagiousText == chronicContagiousText) &&
            (identical(other.hadCriminalCase, hadCriminalCase) ||
                other.hadCriminalCase == hadCriminalCase) &&
            (identical(other.criminalCaseIdText, criminalCaseIdText) ||
                other.criminalCaseIdText == criminalCaseIdText) &&
            (identical(other.criminalCaseText, criminalCaseText) ||
                other.criminalCaseText == criminalCaseText) &&
            (identical(other.homeless, homeless) ||
                other.homeless == homeless) &&
            (identical(other.disabledPerson, disabledPerson) ||
                other.disabledPerson == disabledPerson) &&
            (identical(other.disabledCertificateNo, disabledCertificateNo) ||
                other.disabledCertificateNo == disabledCertificateNo));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        maritalStatusId,
        educationId,
        occupationId,
        incomeId,
        livingWithLast30days,
        parentRelationshipId,
        startDate,
        isToBeNumberOneMember,
        drugUsageApproach,
        mainDrugText,
        mentalEvalLevel,
        frequencyOfUse,
        feelingAddicted,
        irresponsible,
        frequencyOfProblem,
        beNoticed,
        stopUsingButNotSuccess,
        injectableDrug,
        last3monthUsage,
        hadMentalTreatment,
        mentalTreatmentText,
        hadChronicContagious,
        chronicContagiousId,
        chronicContagiousText,
        hadCriminalCase,
        criminalCaseIdText,
        criminalCaseText,
        homeless,
        disabledPerson,
        disabledCertificateNo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningImplCopyWith<_$ScreeningImpl> get copyWith =>
      __$$ScreeningImplCopyWithImpl<_$ScreeningImpl>(this, _$identity);
}

abstract class _Screening implements Screening {
  const factory _Screening(
      {required final int maritalStatusId,
      required final int educationId,
      required final int occupationId,
      required final int incomeId,
      required final String livingWithLast30days,
      required final int parentRelationshipId,
      required final String startDate,
      required final String isToBeNumberOneMember,
      required final String drugUsageApproach,
      required final String mainDrugText,
      required final String mentalEvalLevel,
      required final String frequencyOfUse,
      required final String feelingAddicted,
      required final String irresponsible,
      required final String frequencyOfProblem,
      required final String beNoticed,
      required final String stopUsingButNotSuccess,
      required final String injectableDrug,
      required final String last3monthUsage,
      required final String hadMentalTreatment,
      required final int mentalTreatmentText,
      required final String hadChronicContagious,
      required final int chronicContagiousId,
      required final int chronicContagiousText,
      required final String hadCriminalCase,
      required final int criminalCaseIdText,
      required final int criminalCaseText,
      required final String homeless,
      required final String disabledPerson,
      required final String disabledCertificateNo}) = _$ScreeningImpl;

  @override
  int get maritalStatusId;
  @override //** สถานะ find on  /master/${patientId} */
  int get educationId;
  @override //** การศึกษา  /master/educations */
  int get occupationId;
  @override //**อาชีพ  /master/occupations */
  int get incomeId;
  @override //**รายได้  /master/incomes */
  String get livingWithLast30days;
  @override // /screenings/${patientId} */
  int get parentRelationshipId;
  @override //**ความสัมพันธ์ระหว่างบิดามารดา */master/relationships
  String get startDate;
  @override // ว/ด/ป  /screenings/${patientId}
  String get isToBeNumberOneMember;
  @override //การใช้ยาเสพติด  /screenings/${patientId}
  String get drugUsageApproach;
  @override //การใช้ยาเสพติด(รูปแบบการเสพ)  /screenings/${patientId}
  String get mainDrugText;
  @override //ยาเสพติดที่ใช้  /master/drugs  #หมายเหตุ  answer == 17 show  other=""
  String get mentalEvalLevel;
  @override //** สรุปผล find on  /screenings/${patientId} */
  String get frequencyOfUse;
  @override //** คุณใช้บ่อยเพียงใด  find on  /screenings/${patientId} */
  String get feelingAddicted;
  @override //** คุณมีความต้องการ หรือมีความรู้สึกอยากใช้  find on  /screenings/${patientId} */
  String get irresponsible;
  @override //** การใช้ ยาบ้า ทำให้คุณไม่สามารถรับผิดชอบ หรือทำกิจกรรมที่คุณเคยทำได้ตามปกติบ่อยเพียงใด  find on  /screenings/${patientId} */
  String get frequencyOfProblem;
  @override //** การใช้ ทำให้คุณเกิดปัญหาสุขภาพ ครอบครัว สังคม กฏหมาย หรือการเงินบ่อยเพียงใด?  find on  /screenings/${patientId} */
  String get beNoticed;
  @override //** ญาติ เพื่อน หรือคนรู้จัก   find on  /screenings/${patientId} */
  String get stopUsingButNotSuccess;
  @override //** คุนเคย find on  /screenings/${patientId} */
  String get injectableDrug;
  @override //** คุณเคยใช้สารเสพติดชนิดฉีดหรือไม่ /screenings/${patientId} */
  String get last3monthUsage;
  @override //** ภายใน 3 เดือนที่ผ่านมา คุณใช้บ่อยเพียงใด find on  /screenings/${patientId} */
  String get hadMentalTreatment;
  @override //**ประวัติรักษาโรคสุขภาพจิต find on  /screenings/${patientId} */
  int get mentalTreatmentText;
  @override //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadMentalTreatment == "YES" && show  ui เพิ่ม Text to ui  /master/mentaltreatments */
  String get hadChronicContagious;
  @override //**ประวัติโรคเรื้อรัง / โรคติดต่อ find on  /screenings/${patientId} */
  int get chronicContagiousId;
  @override
  int get chronicContagiousText;
  @override //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadChronicContagious == "YES" && show  ui เพิ่ม Text to ui  /master/chroniccontagiouses */
  String get hadCriminalCase;
  @override //**ประวัติคดีอาญา / โรคติดต่อ find on  /screenings/${patientId} */
//----------
  int get criminalCaseIdText;
  @override //-------
  int get criminalCaseText;
  @override //**ประวัติรักษาโรคสุขภาพจิต find on  การใช้งาน เช็ค hadCriminalCase == "YES" && show  ui เพิ่ม Text to ui  /master/criminalcases */
  String get homeless;
  @override //**คนเร่ร่อน ไร้ที่พักพิง find on  /screenings/${patientId} */
  String get disabledPerson;
  @override //**ผู้พิการ find on  /screenings/${patientId} */
  String get disabledCertificateNo;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningImplCopyWith<_$ScreeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
