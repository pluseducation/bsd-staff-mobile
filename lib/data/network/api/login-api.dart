import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class LoginApi extends BaseApi {
  LoginApi({required super.baseUrl});

  Future<LoginEntity> login({
    required String username,
    required String password,
  }) async {
    try {
      final Dio dio = await getDio();
      final response = await dio.post(
        '/login?mobile=true',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginEntity.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.data.toString(),
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<LoginEntity> loginForOtp({
    required String username,
    required String password,
  }) async {
    try {
      final Dio dio = await getDio();
      final response = await dio.post(
        '/login?mobile=false',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginEntity.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.data.toString(),
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<LoginEntity> loginWithPin({
    required String username,
    required String pin,
  }) async {
    try {
      final Dio dio = await getDio();
      final response = await dio.post(
        '/login?mobile=true&pin=true',
        data: {
          'username': username,
          'pin': pin,
        },
      );

      if (response.statusCode == 200) {
        return LoginEntity.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.data as String,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }
}
