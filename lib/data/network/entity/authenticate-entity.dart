import 'package:json_annotation/json_annotation.dart';
part 'authenticate-entity.g.dart';

@JsonSerializable()
class AuthenticateEntity {
  String accessToken;
  String refreshToken;

  AuthenticateEntity({required this.accessToken, required this.refreshToken});

  factory AuthenticateEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateEntityToJson(this);
}
