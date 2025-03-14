import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/profile.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProfileModel extends ChangeNotifier {
  final Logger log;
  final ProfileRepository profileRepository;
  final AppService appService;

  late ValueNotifier<Profile?> dataNotifier;
  late Profile officer;

  ProfileModel({
    required this.log,
    required this.profileRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<Profile?> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      final officerId = await appService.preferencesRepo.getOfficerId();
      if (officerId == null) {
        return false;
      }

      officer = await profileRepository.findProfileByOfficerId(officerId);
      this.dataNotifier.value = officer;
      return true;
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }

  Future<void> logout() async {
    await appService.logout();
  }
}
