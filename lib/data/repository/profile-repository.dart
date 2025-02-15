import 'dart:io';

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
    final profileEntity = await profileApi.findProfile(officerId: officerId);

    final String fullname =
        "${convertToString(profileEntity.nameTh)} ${convertToString(profileEntity.surnameTh)}";

    final profile = Profile(
      fullname: fullname,
      phoneNo: convertToString(profileEntity.phoneNo, defaultValue: "-"),
      username: convertToString(profileEntity.username, defaultValue: "-"),
      subDivisionName: convertToString(profileEntity.subDivisionId),
    );

    return profile;
  }

  Future<bool> updateProfile(
    int officerId,
    String password,
    String confirmPassword,
  ) async {
    final entityProfile = await profileApi.findProfile(officerId: officerId);

    final result = await profileApi.updateProfile(
      entityProfile: entityProfile,
      password: password,
      confirmPassword: confirmPassword,
    );

    return result;
  }
}
