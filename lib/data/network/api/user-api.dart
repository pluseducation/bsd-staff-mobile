import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class UserApi extends BaseApi {
  UserApi({required super.baseUrl});

  Future<bool> deleteUser() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.delete(
        '/users',
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
