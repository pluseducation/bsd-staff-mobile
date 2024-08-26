import 'package:bst_staff_mobile/data/network/api/profile-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ProfileRepository {
  final ProfileApi profileApi;
  final NetworkMapper networkMapper;

  ProfileRepository({
    required this.profileApi,
    required this.networkMapper,
  });

  Future<Profile> findProfileByOfficerId(int officerId) async {
    final entityPatient = await profileApi.findProfile(officerId: officerId);

    final String fullname =
        "${convertToString(entityPatient.nameTh)} ${convertToString(entityPatient.surnameTh)}";

    final String phone = convertToString(entityPatient.phoneNo);

    final String username = convertToString(entityPatient.username);

    print("finish");

    final profile = Profile(
      fullname: fullname,
      phoneNo: phone,
      username: username,
    );

    return profile;
  }
}
