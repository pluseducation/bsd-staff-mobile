import 'package:json_annotation/json_annotation.dart';
part 'login-entity.g.dart';

@JsonSerializable()
class LoginEntity {
  String? accessToken;
  String? refreshToken;
  String? reqAuthenToken;
  bool? loggedTooLong;
  String? phoneNo;

  LoginEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.reqAuthenToken,
    required this.loggedTooLong,
    required this.phoneNo,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}

@JsonSerializable()
class ProfilesOfficerEntity {
  int? id;
  String? name;
  String? surname;
  String? subDivisionName;
  String? roleName;
  List<String>? roleScopes;

  ProfilesOfficerEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.subDivisionName,
    required this.roleName,
    required this.roleScopes,
  });

  factory ProfilesOfficerEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfilesOfficerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesOfficerEntityToJson(this);
}
