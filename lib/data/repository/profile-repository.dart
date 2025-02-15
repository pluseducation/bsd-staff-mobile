import 'package:bst_staff_mobile/data/network/api/profile-api.dart';
import 'package:bst_staff_mobile/data/network/api/user-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ProfileRepository {
  final ProfileApi profileApi;
  final UserApi userApi;
  final NetworkMapper networkMapper;
  final String baseUrl;

  ProfileRepository({
    required this.profileApi,
    required this.userApi,
    required this.networkMapper,
    required this.baseUrl,
  });

  Future<Profile> findProfileByOfficerId(int officerId) async {
    final profileEntity = await profileApi.findProfile();

    final String fullname =
        "${convertToString(profileEntity.name)} ${convertToString(profileEntity.surname)}";

    final profile = Profile(
      fullname: fullname,
      phoneNo: convertToString(profileEntity.phoneNo, defaultValue: "-"),
      username: convertToString(profileEntity.username, defaultValue: "-"),
      subDivisionName:
          convertToString(profileEntity.subDivisionName, defaultValue: "-"),
    );

    return profile;
  }

  Future<bool> updateProfile(
    String password,
    String confirmPassword,
  ) async {
    await profileApi.updateProfile(
      password: password,
      confirmPassword: confirmPassword,
    );

    return true;
  }
}
