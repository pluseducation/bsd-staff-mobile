import 'package:json_annotation/json_annotation.dart';
part 'config-server-entity.g.dart';

@JsonSerializable()
class ConfigServerEntity {
  String? iosVersion;
  String? iosUpdateUrl;
  String? iosIsDeploy;
  String? androidVersion;
  String? androidUpdateUrl;
  String? androidIsDeploy;

  ConfigServerEntity({
    required this.iosVersion,
    required this.iosUpdateUrl,
    required this.iosIsDeploy,
    required this.androidVersion,
    required this.androidUpdateUrl,
    required this.androidIsDeploy,
  });

  factory ConfigServerEntity.fromJson(Map<String, dynamic> json) =>
      _$ConfigServerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigServerEntityToJson(this);
}
