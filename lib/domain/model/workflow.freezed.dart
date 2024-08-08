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
  int get religionText =>
      throw _privateConstructorUsedError; //ศาสนา ** /master/religions
  String get registereText =>
      throw _privateConstructorUsedError; //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
  String get currentAddrText =>
      throw _privateConstructorUsedError; //ที่อยู่ปัจจุบัน ** find on patient
  String get guardianfullNameText =>
      throw _privateConstructorUsedError; //ข้อมูลผู้ปกครอง **  find on patient
  int get relationShipId =>
      throw _privateConstructorUsedError; // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
  String get guardianPhoneNo =>
      throw _privateConstructorUsedError; // เบอร์โทร 02-xxx-xxx   ** find on patient
  String get joinTreatmentByText =>
      throw _privateConstructorUsedError; //เข้าร่วมการรักษา ** find on questionchoices
  String get joinSentByCourtText => throw _privateConstructorUsedError;

  /// Create a copy of Registering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      int religionText,
      String registereText,
      String currentAddrText,
      String guardianfullNameText,
      int relationShipId,
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

  /// Create a copy of Registering
  /// with the given fields replaced by the non-null parameter values.
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
    Object? relationShipId = null,
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
              as int,
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
      relationShipId: null == relationShipId
          ? _value.relationShipId
          : relationShipId // ignore: cast_nullable_to_non_nullable
              as int,
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
      int religionText,
      String registereText,
      String currentAddrText,
      String guardianfullNameText,
      int relationShipId,
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

  /// Create a copy of Registering
  /// with the given fields replaced by the non-null parameter values.
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
    Object? relationShipId = null,
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
              as int,
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
      relationShipId: null == relationShipId
          ? _value.relationShipId
          : relationShipId // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.relationShipId,
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
  final int religionText;
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
  final int relationShipId;
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
    return 'Registering(fullname: $fullname, patientStatus: $patientStatus, level: $level, dateOfBirthText: $dateOfBirthText, gender: $gender, nationalityText: $nationalityText, religionText: $religionText, registereText: $registereText, currentAddrText: $currentAddrText, guardianfullNameText: $guardianfullNameText, relationShipId: $relationShipId, guardianPhoneNo: $guardianPhoneNo, joinTreatmentByText: $joinTreatmentByText, joinSentByCourtText: $joinSentByCourtText)';
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
            (identical(other.relationShipId, relationShipId) ||
                other.relationShipId == relationShipId) &&
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
      relationShipId,
      guardianPhoneNo,
      joinTreatmentByText,
      joinSentByCourtText);

  /// Create a copy of Registering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final int religionText,
      required final String registereText,
      required final String currentAddrText,
      required final String guardianfullNameText,
      required final int relationShipId,
      required final String guardianPhoneNo,
      required final String joinTreatmentByText,
      required final String joinSentByCourtText}) = _$RegisteringImpl;

  @override
  String
      get fullname; //** find on profile name + surname /patients/${patientId}/profile */
  @override
  String get patientStatus; //**  /patients/${nationalityText}/profile */
  @override
  String get level; //**  /patients/${patientId}/profile */
  @override
  String get dateOfBirthText; //ว/ด/ป ** '/api/v1/patients$patientsid' */
  @override
  String get gender; // เพศ* "/questionchoices$REGISTERING */
  @override
  String get nationalityText; //สัญชาติ** /master/nationalities */
  @override
  int get religionText; //ศาสนา ** /master/religions
  @override
  String get registereText; //  ที่อยู่ตามทะเบียนราษฎร์ ** find on patient
  @override
  String get currentAddrText; //ที่อยู่ปัจจุบัน ** find on patient
  @override
  String get guardianfullNameText; //ข้อมูลผู้ปกครอง **  find on patient
  @override
  int get relationShipId; // ** ความสัมพันธ์ (บิดา),(มารดา)  ** find on patient
  @override
  String get guardianPhoneNo; // เบอร์โทร 02-xxx-xxx   ** find on patient
  @override
  String get joinTreatmentByText; //เข้าร่วมการรักษา ** find on questionchoices
  @override
  String get joinSentByCourtText;

  /// Create a copy of Registering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisteringImplCopyWith<_$RegisteringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
