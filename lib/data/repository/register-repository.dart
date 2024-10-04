import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/api/register-api.dart';
import 'package:bst_staff_mobile/domain/model/register.dart';

class RegisterRepository {
  final RegisterApi registerApi;
  final OtpApi otpApi;

  RegisterRepository({
    required this.registerApi,
    required this.otpApi,
  });

  Future<Register> findRisterByPhone(String phone) async {
    final entity = await registerApi.findRegister(phone: phone);

    final register = Register(
      username: entity.username ?? "",
      password: "",
      confirmPassword: "",
      name: entity.name ?? "",
      surname: entity.surname ?? "",
      phone: entity.phone ?? "",
      nationalId: entity.nationalId ?? "",
      reqAuthenToken: entity.reqAuthenToken ?? "",
      refNo: "",
      status: "",
      token: "",
      pin: "",
      accessToken: "",
    );

    return register;
  }

  Future<Register> findOtp({
    required Register register,
  }) async {
    final entity = await otpApi.findOtp(
      phone: register.phone,
      reqAuthenToken: register.reqAuthenToken,
    );

    register.refNo = entity.refno ?? '';
    register.status = entity.status ?? '';
    register.token = entity.token ?? '';

    return register;
  }

  Future<void> confirmOtp({
    required Register register,
  }) async {
    final entity = await otpApi.confirmOtp(
      phone: register.phone,
      refNo: register.refNo,
      token: register.token,
      pin: register.pin,
      reqAuthenToken: register.reqAuthenToken,
    );

    register.accessToken = entity.accessToken ?? "";
  }

  Future<void> confirmPassword(
    Register register,
  ) async {
    await registerApi.confirmPassword(
      password: register.password,
      confirmPassword: register.confirmPassword,
      accessToken: register.accessToken,
    );
  }
}
