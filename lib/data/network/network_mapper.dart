import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/domain/exception/mapper-exception.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:logger/logger.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  // authenticate
  Login toLogin(LoginEntity entity) {
    try {
      return Login(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        loggedTooLong: entity.loggedTooLong,
        phoneNo: entity.phoneNo,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }
}
