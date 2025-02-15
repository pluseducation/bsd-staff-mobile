import 'package:json_annotation/json_annotation.dart';

part 'profile-entity.g.dart';

// profile
@JsonSerializable()
class ProfileEntity {
  int? id;
  String? username;
  String? name;
  String? surname;
  String? imageUrl;
  int? subDivisionId;
  String? subDivisionName;
  String? subDivisionLevel;
  String? roleName;
  String? phoneNo;

  ProfileEntity({
    required this.id,
    required this.username,
    required this.name,
    required this.surname,
    required this.imageUrl,
    required this.subDivisionId,
    required this.subDivisionName,
    required this.subDivisionLevel,
    required this.roleName,
    required this.phoneNo,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}

// ----------ProfileUpdateEntity-------------------
@JsonSerializable()
class ProfileUpdateEntity {
  int? userId;
  String? username;
  int? roleId;
  int? subDivisionId;
  bool? active;
  int? officerId;
  String? nameTh;
  String? surnameTh;
  String? nationalId;
  String? phoneNo;
  String? email;

  ProfileUpdateEntity({
    required this.userId,
    required this.username,
    required this.roleId,
    required this.subDivisionId,
    required this.active,
    required this.officerId,
    required this.nameTh,
    required this.surnameTh,
    required this.nationalId,
    required this.phoneNo,
    required this.email,
  });

  factory ProfileUpdateEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUpdateEntityToJson(this);
}

// profile officer
@JsonSerializable()
class ProfileOfficerEntity {
  int? id;
  String? name;
  String? surname;
  String? imageUrl;
  int? subDivisionId;
  String? subDivisionName;
  String? subDivisionLevel;
  String? roleName;
  List<String?> roleScopes;

  ProfileOfficerEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
    required this.subDivisionId,
    required this.subDivisionName,
    required this.subDivisionLevel,
    required this.roleName,
    required this.roleScopes,
  });

  factory ProfileOfficerEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileOfficerEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileOfficerEntityToJson(this);
}
