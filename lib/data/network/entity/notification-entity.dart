import 'package:json_annotation/json_annotation.dart';
part 'notification-entity.g.dart';

@JsonSerializable()
class NotificationEntity {
  List<NotificationContentEntity>? content;
  int totalPages;
  int totalElements;

  NotificationEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}

@JsonSerializable()
class NotificationContentEntity {
  int? id;
  String? type;
  String? title;
  String? msg;
  int? acknowledged;

  NotificationContentEntity({
    required this.id,
    required this.type,
    required this.msg,
    required this.acknowledged,
  });

  factory NotificationContentEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentEntityFromJson(json);
}
