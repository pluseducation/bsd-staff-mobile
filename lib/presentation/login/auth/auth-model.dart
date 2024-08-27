import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class AuthModel {
  final Logger log;
  final LoginRepository loginRepository;
  final AppService appService;

  AuthModel({
    required this.log,
    required this.loginRepository,
    required this.appService,
  });

  Future<void> handleAuth() async {
    try {
      loginRepository.updateUserSession(true);
      appService.intervalWebAuth();
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

  Future<void> handleCancel() async {
    try {
      loginRepository.updateUserSession(false);
      appService.intervalWebAuth();
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
}
