import 'package:json_annotation/json_annotation.dart';

part 'login-db-entity.g.dart';

@JsonSerializable()
class LoginDbEntity {
  static const fieldId = 'login_id';
  static const fieldUsername = 'username';
  static const fieldPin = 'pin';

  @JsonKey(name: fieldId)
  final int? id;
  @JsonKey(name: fieldUsername)
  final String username;
  @JsonKey(name: fieldPin)
  final String? pin;

  LoginDbEntity({
    required this.id,
    required this.username,
    required this.pin,
  });

  factory LoginDbEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginDbEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDbEntityToJson(this);
}
