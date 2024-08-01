import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';

class LoginRepository {
  final LoginApi loginApi;
  final NetworkMapper networkMapper;

  LoginRepository({
    required this.loginApi,
    required this.networkMapper,
  });

  Future<Login> login({
    required String username,
    required String password,
  }) async {
    final entitie =
        await loginApi.login(username: username, password: password);

    final login = networkMapper.toLogin(entitie);
    return login;
  }
}
