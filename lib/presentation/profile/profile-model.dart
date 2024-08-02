import 'package:device_info_plus/device_info_plus.dart';
import 'package:logger/logger.dart';

class LoginModel {
  final Logger log;
  String model = "";
  String serialNumber = "";
  String finger = "";
  String id = "";
  String androidVersion = "";
  String androidSdk = "";
  int count = 0;

  LoginModel({required this.log});

  Future<void> setAndroidInfo() async {
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      serialNumber = androidInfo.serialNumber;
      finger = androidInfo.fingerprint;
      id = androidInfo.id;
      androidVersion = androidInfo.version.release;
      androidSdk = androidInfo.version.sdkInt.toString();
      count++;
    } catch (e) {
      log.e('System Error', error: e);
      rethrow;
    }
  }
}
