import 'package:json_annotation/json_annotation.dart';
part 'forgot-entity.g.dart';

@JsonSerializable()
class ForgotEntity {
  String? reqAuthenToken;
  String? phoneNo;

  ForgotEntity({
    required this.reqAuthenToken,
    required this.phoneNo,
  });

  factory ForgotEntity.fromJson(Map<String, dynamic> json) =>
      _$ForgotEntityFromJson(json);
}
