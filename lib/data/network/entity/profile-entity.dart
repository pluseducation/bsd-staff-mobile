import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'profile-entity.g.dart';

// profile
@JsonSerializable()
class ProfileEntity {
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

  ProfileEntity({
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
