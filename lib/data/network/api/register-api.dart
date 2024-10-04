import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/register-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class RegisterApi extends BaseApi {
  RegisterApi({required super.baseUrl});

  Future<RegisterEntity> findRegister({
    required String phone,
  }) async {
    try {
      final Dio dio = await getDio();
      final response = await dio.get(
        '/registers?phone=$phone',
      );
      // print('Response: ${response.data}');
      if (response.statusCode == 200) {
        return RegisterEntity.fromJson(
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

  Future<bool> confirmPassword({
    required String password,
    required String confirmPassword,
    required String accessToken,
  }) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(accessToken);
      final response = await dio.post(
        '/registers',
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
}
