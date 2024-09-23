import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String fullname, // ชื่อ-สกุล nameTh +  surnameTh  /officers${data}
    required String phoneNo, // เบอร์โทร / officers${data}
    required String username, // ชื่อบัญชีเข้าใช้งาน  /officers${data}
    required String imageUrl,
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
