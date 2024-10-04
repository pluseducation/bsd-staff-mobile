import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

@unfreezed
class Register with _$Register {
  factory Register({
    required String username,
    required String password,
    required String confirmPassword,
    required String name,
    required String surname,
    required String phone,
    required String nationalId,
    required String reqAuthenToken,

    // for otp
    required String refNo,
    required String status,
    required String token,
    required String pin,

    // token for main
    required String accessToken,
  }) = _Register;
}
