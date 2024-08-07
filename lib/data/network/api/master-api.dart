import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/master-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class MasterApi extends BaseApi {
  MasterApi({required super.baseUrl});

  // ---NationalityEntity
  Future<List<NationalityEntity>> findNationality() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/nationalities');

      if (response.statusCode == 200) {
        return nationalitiesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
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

  Future<List<ReligionsEntity>> findReligions() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/religions');

      if (response.statusCode == 200) {
        return religionsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
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
