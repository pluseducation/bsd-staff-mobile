import 'dart:io';

import 'package:bst_staff_mobile/data/network/api/profile-api.dart';
import 'package:bst_staff_mobile/data/network/entity/profile-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ProfileRepository {
  final ProfileApi profileApi;
  final NetworkMapper networkMapper;
  final String baseUrl;

  ProfileRepository({
    required this.profileApi,
    required this.networkMapper,
    required this.baseUrl,
  });

  Future<Profile> findProfileByOfficerId(int officerId) async {
    final profileEntity = await profileApi.findProfile(officerId: officerId);
    final profileOfficerEntity = await profileApi.findProfileOfficer();

    final String fullname =
        "${convertToString(profileEntity.nameTh)} ${convertToString(profileEntity.surnameTh)}";

    final String phone =
        (profileEntity.phoneNo != null && profileEntity.phoneNo!.isNotEmpty)
            ? convertToString(profileEntity.phoneNo)
            : "-";
    final String username =
        (profileEntity.username != null && profileEntity.username!.isNotEmpty)
            ? convertToString(profileEntity.username)
            : "-";
    final imageUrl = profileOfficerEntity.imageUrl != null
        ? baseUrl + convertToString(profileOfficerEntity.imageUrl)
        : '';

    final profile = Profile(
      fullname: fullname,
      phoneNo: phone,
      username: username,
      imageUrl: imageUrl,
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

  Future<String> updateProfileImage(
    File image,
  ) async {
    final result = await profileApi.uploadImage(
      file: image,
    );

    final profileEntity = await profileApi.findProfileOfficer();
    final imageUrl = profileEntity.imageUrl != null
        ? baseUrl + convertToString(profileEntity.imageUrl)
        : '';

    return imageUrl;
  }
}
