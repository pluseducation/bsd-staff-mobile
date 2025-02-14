import 'package:json_annotation/json_annotation.dart';

part 'notification-config-entity.g.dart';

@JsonSerializable()
class NotificationConfigEntity {
  bool? appointment;
  bool? monitoring;
  bool? refer;
  bool? assistant;
  bool? login;

  NotificationConfigEntity({
    required this.appointment,
    required this.monitoring,
    required this.refer,
    required this.assistant,
    required this.login,
  });

  factory NotificationConfigEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationConfigEntityToJson(this);
}
