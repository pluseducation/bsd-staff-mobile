import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class UserApi extends BaseApi {
  UserApi({required super.baseUrl});

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
}
