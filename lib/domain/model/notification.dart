import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@unfreezed
class Notification with _$Notification {
  factory Notification({
    required bool appointment, // การนัดหมาย
    required bool monitoring, // การติดตาม
    required bool refer, // การส่งต่อ
    required bool assistant, // การช่วยเหลือ
    required bool login, // เมื่อมีการ login web
  }) = _Notification;
}
