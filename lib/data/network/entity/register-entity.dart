import 'package:json_annotation/json_annotation.dart';

part 'register-entity.g.dart';

@JsonSerializable()
class RegisterEntity {
  String? username;
  String? name;
  String? surname;
  String? phone;
  String? nationalId;
  String? reqAuthenToken;

  RegisterEntity({
    required this.username,
    required this.name,
    required this.surname,
    required this.phone,
    required this.nationalId,
    required this.reqAuthenToken,
  });
  factory RegisterEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterEntityToJson(this);
}

// ----------RegisterFormEntity------------------
@JsonSerializable()
class RegisterFormEntity {
  String? password;
  String? confirmPassword;

  RegisterFormEntity({
    required this.password,
    required this.confirmPassword,
  });
  factory RegisterFormEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterFormEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterFormEntityToJson(this);
}

// -----------------OtpEntity-------------------

@JsonSerializable()
class OtpEntity {
  String? refno;
  String? status;
  String? token;

  OtpEntity({
    required this.refno,
    required this.status,
    required this.token,
  });

  factory OtpEntity.fromJson(Map<String, dynamic> json) =>
      _$OtpEntityFromJson(json);

  get reqAuthenToken => null;
  Map<String, dynamic> toJson() => _$OtpEntityToJson(this);
}
// -----------------ConfirmOtpEntity-------------------

@JsonSerializable()
class ConfirmOtpEntity {
  String? accessToken;
  String? refreshToken;
  String? reqAuthenToken;
  bool? loggedTooLong;
  String? phoneNo;
  String? nationalId;
  bool? migrate;

  ConfirmOtpEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.reqAuthenToken,
    required this.loggedTooLong,
    required this.phoneNo,
    required this.nationalId,
    required this.migrate,
  });

  factory ConfirmOtpEntity.fromJson(Map<String, dynamic> json) =>
      _$ConfirmOtpEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmOtpEntityToJson(this);
}
