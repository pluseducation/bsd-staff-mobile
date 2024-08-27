import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProfileModel {
  final Logger log;
  final ProfileRepository profileRepository;
  final AppService appService;

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  final passwordController = TextEditingController();

  ProfileModel({
    required this.log,
    required this.profileRepository,
    required this.appService,
  });

  Future<Profile> findProfile(int officerId) async {
    return profileRepository.findProfileByOfficerId(officerId);
  }

  Future<int?> findOfficerId() async {
    return appService.preferencesRepo.getOfficerId();
  }

  Future<ProfileUpdate> findProfileUpdate(
    String password,
    String confirmPassword,
  ) async {
    return profileRepository.findProfileUpdate(password, confirmPassword);
  }

  Future<void> logout() async {
    await appService.logout();
  }
}
