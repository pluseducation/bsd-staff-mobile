import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/usersession-entity.dart';
import 'package:bst_staff_mobile/domain/exception/mapper-exception.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:bst_staff_mobile/domain/model/session.dart';
import 'package:logger/logger.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  Session toUserSession(UserSessionEntity entity) {
    try {
      return Session(
        status: entity.status ?? "",
        webAgentId: entity.webAgentId ?? "",
        mobileDeviceId: entity.mobileDeviceId ?? "",
        loginAt: entity.loginAt ?? DateTime.now(),
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }
}
