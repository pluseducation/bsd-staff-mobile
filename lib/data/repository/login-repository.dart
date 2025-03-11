import 'package:bst_staff_mobile/data/database/dao/login-dao.dart';
import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/api/officer-api.dart';
import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/api/user-api.dart';
import 'package:bst_staff_mobile/data/network/api/usersession-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:bst_staff_mobile/domain/model/session.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/encryp.dart';

class LoginRepository {
  final LoginApi loginApi;
  final OfficerApi officerApi;
  final OtpApi otpApi;
  final UserSessionApi userSessionApi;
  final UserApi userApi;
  final LoginDao loginDao;
  final NetworkMapper networkMapper;

  LoginRepository({
    required this.loginApi,
    required this.loginDao,
    required this.officerApi,
    required this.otpApi,
    required this.userSessionApi,
    required this.userApi,
    required this.networkMapper,
  });

  Future<bool> isHavePin() async {
    final dbLoginEntity = await loginDao.find();
    return dbLoginEntity != null;
  }

  Future<Login> login({
    required String username,
    required String password,
  }) async {
    final entity = await loginApi.login(username: username, password: password);

    return Login(
      username: username,
      accessToken: convertToString(entity.accessToken),
      refreshToken: convertToString(entity.refreshToken),
      reqAuthenToken: convertToString(entity.reqAuthenToken),
      loggedTooLong: entity.loggedTooLong ?? false,
      phoneNo: convertToString(entity.phoneNo),
    );
  }

  Future<Login> loginForOtp({
    required String username,
    required String password,
  }) async {
    final entity =
        await loginApi.loginForOtp(username: username, password: password);

    return Login(
      username: username,
      accessToken: convertToString(entity.accessToken),
      refreshToken: convertToString(entity.refreshToken),
      reqAuthenToken: convertToString(entity.reqAuthenToken),
      loggedTooLong: entity.loggedTooLong ?? false,
      phoneNo: convertToString(entity.phoneNo),
    );
  }

  Future<bool> findOtp({
    required String phone,
    required String token,
  }) async {
    await otpApi.findOtp(phone: phone, reqAuthenToken: token);
    //final login = networkMapper.toLogin(entitie);
    return true;
  }

  Future<ProfilesOfficer> findProfilesOfficer() async {
    final entityProfileOfficer = await officerApi.findProfilesOfficer();

    final int id = entityProfileOfficer.id ?? 0;
    final String roleName = convertToString(entityProfileOfficer.roleName);
    final List<String> roleScopes = entityProfileOfficer.roleScopes ?? [];

    final profilesOfficer =
        ProfilesOfficer(id: id, roleName: roleName, roleScopes: roleScopes);

    return profilesOfficer;
  }

  // for to authen
  Future<Session> findUserSession() async {
    final entity = await userSessionApi.findUsersession();
    final model = networkMapper.toUserSession(entity);
    return model;
  }

  Future<void> updateUserSession(bool complete) async {
    await userSessionApi.updateUsersession(complete: complete);
  }

  // for pin
  Future<Login> loginWithPin(
    String pin,
  ) async {
    // find username from local
    final dbLoginEntity = await loginDao.find();
    if (dbLoginEntity == null) {
      throw Exception('ไม่พบข้อมูลการเข้าสู่ระบบด้วย PIN Code');
    }

    final username = dbLoginEntity.username;
    final hashPin = encrypPin(pin);

    final entity = await loginApi.loginWithPin(
      username: username,
      pin: hashPin,
    );

    final login = Login(
      username: username,
      accessToken: convertToString(entity.accessToken),
      refreshToken: convertToString(entity.refreshToken),
      reqAuthenToken: convertToString(entity.reqAuthenToken),
      loggedTooLong: entity.loggedTooLong ?? false,
      phoneNo: convertToString(entity.phoneNo),
    );

    return login;
  }

  // for notification
  Future<bool> updateFCMToken(
    String accessToken,
    String fcmToken,
  ) async {
    return await userApi.updateFCM(
      accessToken,
      fcmToken,
    );
  }
}
