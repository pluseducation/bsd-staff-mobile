import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot.freezed.dart';

@unfreezed
class Forgot with _$Forgot {
  factory Forgot({
    required String username,
    required String phoneNo,
    required String reqAuthenToken,

    // for otp
    required String refNo,
    required String status,
    required String token,
    required String pin,
    required String accessToken,

    // update password
    required String password,
    required String confirmPassword,
  }) = _Forgot;
}
