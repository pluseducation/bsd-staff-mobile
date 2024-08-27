import 'package:bst_staff_mobile/data/network/api/profile-api.dart';
import 'package:bst_staff_mobile/data/network/entity/profile-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ProfileRepository {
  final ProfileApi profileApi;
  final NetworkMapper networkMapper;
  ProfileEntity? _entityProfile;

  ProfileRepository({
    required this.profileApi,
    required this.networkMapper,
  });

  Future<Profile> findProfileByOfficerId(int officerId) async {
    final entityProfile = await profileApi.findProfile(officerId: officerId);
    _entityProfile = entityProfile; // Store the entityProfile

    final String fullname =
        "${convertToString(entityProfile.nameTh)} ${convertToString(entityProfile.surnameTh)}";

    final String phone =
        (entityProfile.phoneNo != null && entityProfile.phoneNo!.isNotEmpty)
            ? convertToString(entityProfile.phoneNo)
            : "-";
    final String username =
        (entityProfile.username != null && entityProfile.username!.isNotEmpty)
            ? convertToString(entityProfile.username)
            : "-";

    print("finish");

    final profile = Profile(
      fullname: fullname,
      phoneNo: phone,
      username: username,
    );

    return profile;
  }

  Future<ProfileUpdate> findProfileUpdate(
    String password,
    String confirmPassword,
  ) async {
    if (_entityProfile == null) {
      throw Exception(
        "Profile not found. Please call findProfileByOfficerId first.",
      );
    }

    final entityProfileUpdate = await profileApi.findProfileUpdate(
      username: _entityProfile!.username ?? '',
      password: password,
      confirmPassword: confirmPassword,
      name: _entityProfile!.nameTh ?? '',
      surname: _entityProfile!.surnameTh ?? '',
      nationalId: _entityProfile!.nationalId ?? '',
      email: _entityProfile!.email ?? '',
      phoneNo: _entityProfile!.phoneNo ?? '',
      roleId: _entityProfile!.roleId ?? 0,
      subDivisionId: _entityProfile!.subDivisionId ?? 0,
      officerId: _entityProfile!.officerId ?? 0,
      active: _entityProfile!.active ?? false,
      resetPassword: true,
    );

    final profileUpdate = ProfileUpdate(
      username: entityProfileUpdate.username ?? '',
      password: password,
      confirmPassword: confirmPassword,
      name: entityProfileUpdate.nameTh ?? '',
      surname: entityProfileUpdate.surnameTh ?? '',
      nationalId: entityProfileUpdate.nationalId ?? '',
      email: entityProfileUpdate.email ?? '',
      phoneNo: entityProfileUpdate.phoneNo ?? '',
      roleId: entityProfileUpdate.roleId ?? 0,
      subDivisionId: entityProfileUpdate.subDivisionId ?? 0,
      officerId: entityProfileUpdate.officerId ?? 0,
      active: entityProfileUpdate.active ?? false,
      resetPassword: true,
    );

    return profileUpdate;
  }
}
