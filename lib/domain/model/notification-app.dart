import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification-app.freezed.dart';

@unfreezed
class SearchNotification with _$SearchNotification {
  factory SearchNotification({
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchNotification;
}

@unfreezed
class NotificationApp with _$NotificationApp {
  factory NotificationApp({
    required int id,
    required String title,
    required String msg,
    // required String time,
    // required String timegone,
    required bool acknowledged,
  }) = _NotificationApp;
}
