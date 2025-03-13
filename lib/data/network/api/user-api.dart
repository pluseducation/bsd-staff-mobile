import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/forgot-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class UserApi extends BaseApi {
  UserApi({required super.baseUrl});

  Future<bool> updatePasswordWithToken({
    required String password,
    required String confirmPassword,
    required String accessToken,
  }) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(accessToken);
      final response = await dio.put(
        '/users',
        data: {
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        return response.data as bool;
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

  Future<bool> updateFCM(String accessToken, String fcmToken) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(accessToken);
      final response = await dio.put(
        '/users/fcmtoken',
        data: {'fcmToken': fcmToken},
      );

      if (response.statusCode == 200) {
        return response.data as bool;
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

  Future<bool> updatePin(String pin) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.put(
        '/users/pin',
        data: {'pin': pin},
      );

      if (response.statusCode == 200) {
        return response.data as bool;
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

  Future<bool> updatePinWithToken(
    String pin,
    String accessToken,
  ) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(accessToken);
      final response = await dio.put(
        '/users/pin',
        data: {'pin': pin},
      );

      if (response.statusCode == 200) {
        return response.data as bool;
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

  Future<ForgotEntity> forgot(String username) async {
    try {
      final Dio dio = await getDio();
      final response = await dio.post(
        '/forgot',
        data: {
          'username': username,
        },
      );

      if (response.statusCode == 200) {
        return ForgotEntity.fromJson(
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
