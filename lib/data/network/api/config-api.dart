import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/config-server-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class ConfigApi extends BaseApi {
  ConfigApi({required super.baseUrl});

  Future<ConfigServerEntity> loadConfig() async {
    try {
      final Dio dio = await getDio();
      final response = await dio.get(
        '/api/public/mobile/configs',
      );

      if (response.statusCode == 200) {
        return ConfigServerEntity.fromJson(
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
}
