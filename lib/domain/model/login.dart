import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String accessToken,
    required String refreshToken,
    required String reqAuthenToken,
    required bool loggedTooLong,
    required String phoneNo,
  }) = _Login;
}
