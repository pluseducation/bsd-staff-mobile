import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class LoginRepository {
  final LoginApi loginApi;
  final OfficerApi officerApi;
  final OtpApi otpApi;
  final NetworkMapper networkMapper;

  LoginRepository({
    required this.loginApi,
    required this.officerApi,
    required this.otpApi,
    required this.networkMapper,
  });

  Future<Login> login({
    required String username,
    required String password,
  }) async {
    final entitie =
        await loginApi.login(username: username, password: password);

    final login = networkMapper.toLogin(entitie);
    return login;
  }

  Future<Login> loginForOtp({
    required String username,
    required String password,
  }) async {
    final entitie =
        await loginApi.loginForOtp(username: username, password: password);

    final login = networkMapper.toLogin(entitie);
    return login;
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

    final profilesOfficer = ProfilesOfficer(id: id, roleName: roleName);

    return profilesOfficer;
  }
}
