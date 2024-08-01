import 'package:json_annotation/json_annotation.dart';
part 'login-entity.g.dart';

@JsonSerializable()
class LoginEntity {
  String accessToken;
  String refreshToken;
  bool loggedTooLong;
  String? phoneNo;

  LoginEntity(
      {required this.accessToken,
      required this.refreshToken,
      required this.loggedTooLong,
      required this.phoneNo});

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}
