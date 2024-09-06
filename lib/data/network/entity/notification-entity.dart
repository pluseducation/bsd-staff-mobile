import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'notification-entity.g.dart';

@JsonSerializable()
class NotificationEntity {
  bool? appointment;
  bool? monitoring;
  bool? refer;
  bool? assistant;
  bool? login;

  NotificationEntity({
    required this.appointment,
    required this.monitoring,
    required this.refer,
    required this.assistant,
    required this.login,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}

@JsonSerializable()
class UpdateNotificationEntity {
  bool? appointment;
  bool? monitoring;
  bool? refer;
  bool? assistant;
  bool? login;

  UpdateNotificationEntity({
    required this.appointment,
    required this.monitoring,
    required this.refer,
    required this.assistant,
    required this.login,
  });

  factory UpdateNotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$UpdateNotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNotificationEntityToJson(this);
}
