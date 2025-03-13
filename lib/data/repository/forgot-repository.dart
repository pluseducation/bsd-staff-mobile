import 'package:bst_staff_mobile/data/database/dao/login-dao.dart';
import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/api/user-api.dart';
import 'package:bst_staff_mobile/domain/model/forgot.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ForgotRepository {
  final UserApi userApi;
  final OtpApi otpApi;
  final LoginDao loginDao;

  ForgotRepository({
    required this.userApi,
    required this.otpApi,
    required this.loginDao,
  });

  Future<Forgot> findForgot(String username) async {
    final entity = await userApi.forgot(username);

    final forgot = Forgot(
      username: username,
      phoneNo: convertToString(entity.phoneNo),
      reqAuthenToken: convertToString(entity.reqAuthenToken),
      password: "",
      confirmPassword: "",
      refNo: "",
      status: "",
      token: "",
      pin: "",
      accessToken: "",
    );

    return forgot;
  }

  Future<Forgot> findOtp({
    required Forgot forgot,
  }) async {
    final entity = await otpApi.findOtp(
      phone: forgot.phoneNo,
      reqAuthenToken: forgot.reqAuthenToken,
    );

    forgot.refNo = entity.refno ?? '';
    forgot.status = entity.status ?? '';
    forgot.token = entity.token ?? '';

    return forgot;
  }

  Future<void> confirmOtp({
    required Forgot forgot,
  }) async {
    final entity = await otpApi.confirmOtp(
      phone: forgot.phoneNo,
      refNo: forgot.refNo,
      token: forgot.token,
      pin: forgot.pin,
      reqAuthenToken: forgot.reqAuthenToken,
    );

    forgot.accessToken = entity.accessToken ?? "";
  }

  Future<void> confirmPassword(
    Forgot forgot,
  ) async {
    await userApi.updatePasswordWithToken(
      password: forgot.password,
      confirmPassword: forgot.confirmPassword,
      accessToken: forgot.accessToken,
    );
  }

  Future<void> deletePin() async {
    await loginDao.deleteAll();
  }
}
