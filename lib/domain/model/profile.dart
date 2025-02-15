import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String fullname,
    required String phoneNo,
    required String username,
    required String subDivisionName,
  }) = _Profile;
}

//// Method put officers
@unfreezed
class ProfileUpdate with _$ProfileUpdate {
  factory ProfileUpdate({
    required String username,
    required String password,
    required String confirmPassword,
    required String name,
    required String surname,
    required String nationalId,
    required String email,
    required String phoneNo,
    required int roleId,
    required int subDivisionId,
    required int officerId,
    required bool active,
    required bool resetPassword,
  }) = _ProfileUpdate;
}
