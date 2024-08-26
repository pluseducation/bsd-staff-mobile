import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
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

class ProfileModel {
  final Logger log;
  final ProfileRepository profileRepository;
  final AppService appService;

  ProfileModel({
    required this.log,
    required this.profileRepository,
    required this.appService,
  });

  Future<Profile> findProfile(int officerId) async {
    return profileRepository.findProfileByOfficerId(officerId);
  }
}
