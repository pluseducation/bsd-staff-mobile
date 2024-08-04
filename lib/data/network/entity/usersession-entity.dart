import 'package:json_annotation/json_annotation.dart';
part 'usersession-entity.g.dart';

@JsonSerializable()
class UserSessionEntity {
  String? status;
  String? webAgentId;
  String? mobileDeviceId;
  DateTime? loginAt;

  UserSessionEntity({
    required this.status,
    required this.webAgentId,
    required this.mobileDeviceId,
    required this.loginAt,
  });

  factory UserSessionEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSessionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionEntityToJson(this);
}
