import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class FileApi extends BaseApi {
  FileApi({required super.baseUrl});

  Future<String> findFilePath(String userId, String fileName) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        "/api/v1/staff/profiles/image/$userId/$fileName",
      );

      if (response.statusCode == 200) {
        final results = response.data as List<String>;
        return results.isNotEmpty ? results[0] : "";
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
