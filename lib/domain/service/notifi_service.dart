import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() {
    // Request permissions for iOS
    _firebaseMessaging.requestPermission();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    // Handle messages when the app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      getIt<NavigationService>().navigateToReplacement('/notification');
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Get the FCM token
    _getToken();

    // Get the APNS token for iOS
    // if (Platform.isIOS) {
    //   _getAPNSToken();
    // }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    print('Handling a background message: ${message.messageId}');
  }

  Future<void> _getToken() async {
    try {
      final String? token = await _firebaseMessaging.getToken();
      print("FCM Registration Token: $token");
      // You can also log the token or send it to your server for testing

      if (token != null) {
        // Save the token in shared preferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('fcm_token', token);
      }
      // ignore: empty_catches
    } catch (e) {
      print(e);
    }
  }
}
