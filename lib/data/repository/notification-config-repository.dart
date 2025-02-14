import 'package:bst_staff_mobile/data/network/api/notification-config-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/notification.dart';

class NotificationConfigRepository {
  final NotificationConfigApi notificationConfigApi;
  final NetworkMapper networkMapper;

  NotificationConfigRepository({
    required this.notificationConfigApi,
    required this.networkMapper,
  });

  Future<Notification> findNotification() async {
    final entityNotification = await notificationConfigApi.findNotification();
    final bool appointment = entityNotification.appointment ?? false;
    final bool monitoring = entityNotification.monitoring ?? false;
    final bool refer = entityNotification.refer ?? false;
    final bool assistant = entityNotification.assistant ?? false;
    final bool login = entityNotification.login ?? false;

    final notification = Notification(
      appointment: appointment,
      monitoring: monitoring,
      refer: refer,
      assistant: assistant,
      login: login,
    );

    print('notification111:===>> $notification');

    return notification;
  }

  Future<bool> updateNotification(Notification notification) async {
    await notificationConfigApi.updateNotification(
      appointment: notification.appointment,
      monitoring: notification.monitoring,
      refer: notification.refer,
      assistant: notification.assistant,
      login: notification.login,
    );
    print('notification222:===>> $notification');
    return true;
  }
}
