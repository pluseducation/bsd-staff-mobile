import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String username,
    required String accessToken,
    required String refreshToken,
    required String reqAuthenToken,
    required bool loggedTooLong,
    required String phoneNo,
  }) = _Login;
}

@freezed
class ProfilesOfficer with _$ProfilesOfficer {
  const factory ProfilesOfficer({
    required int id,
    required String roleName,
    required List<String> roleScopes,
  }) = _ProfilesOfficer;
}
