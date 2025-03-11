import 'dart:convert';

import 'package:bst_staff_mobile/data/database/dao/login-dao.dart';
import 'package:bst_staff_mobile/data/database/entity/login-db-entity.dart';
import 'package:bst_staff_mobile/data/network/api/user-api.dart';
import 'package:bst_staff_mobile/util/encryp.dart';

class PinRepository {
  final UserApi userApi;
  final LoginDao loginDao;

  PinRepository({
    required this.userApi,
    required this.loginDao,
  });

  Future<bool> updatePin(String username, String pin) async {
    // Hash the PIN
    final hashedPin = encrypPin(pin);

    // update on server
    final result = await userApi.updatePin(hashedPin);

    // delete all local data and insert the new one
    final dbEntity = LoginDbEntity(
      id: null,
      username: username,
      pin: hashedPin,
    );
    await loginDao.deleteAll();
    await loginDao.insert(dbEntity);

    return result;
  }

  Future<bool> updatePinWithToken(
    String username,
    String pin,
    String token,
  ) async {
    // Hash the PIN
    final hashedPin = encrypPin(pin);

    // update on server
    final result = await userApi.updatePinWithToken(hashedPin, token);

    // delete all local data and insert the new one
    final dbEntity = LoginDbEntity(
      id: null,
      username: username,
      pin: hashedPin,
    );
    await loginDao.deleteAll();
    await loginDao.insert(dbEntity);

    return result;
  }
}
