// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/foundation.dart';
// import 'package:permission_handler/permission_handler.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initNotification() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@drawable/flutter_logo');

//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (
//         int id,
//         String? title,
//         String? body,
//         String? payload,
//       ) async {},
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     final bool? initialized = await notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {
//         if (kDebugMode) {
//           print(
//               'Notification clicked with payload: ${notificationResponse.payload}');
//         }
//       },
//     );

//     if (kDebugMode) {
//       print('Notification initialized: $initialized');
//     }

//     if (await Permission.notification.isDenied) {
//       await Permission.notification.request();
//     }
//   }

//   NotificationDetails notificationDetails() {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: true,
//     );

//     const DarwinNotificationDetails iOSNotificationDetails =
//         DarwinNotificationDetails();

//     return const NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iOSNotificationDetails,
//     );
//   }

//   Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payLoad,
//   }) async {
//     if (kDebugMode) {
//       print('Showing notification with title: $title and body: $body');
//     }
//     return notificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails(),
//       payload: payLoad,
//     );
//   }
// }
