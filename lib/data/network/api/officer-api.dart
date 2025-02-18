import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/officer-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/officer.dart';
import 'package:dio/dio.dart';

class OfficerApi extends BaseApi {
  OfficerApi({required super.baseUrl});

  Future<OfficerEntity> findOfficer({
    required SearchOfficer searchOfficer,
  }) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': searchOfficer.page,
        'size': searchOfficer.size,
      };

      if (searchOfficer.name.isNotEmpty) {
        queryParameters['name'] = searchOfficer.name;
      }

      final response = await dio.get(
        '/api/v1/staff/officers?',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return OfficerEntity.fromJson(
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

  Future<void> updateOfficer({
    required int officerId,
    required bool active,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.patch(
        '/api/v1/staff/officers/$officerId/$active',
      );
      if (response.statusCode == 200) {
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

  Future<ProfilesOfficerEntity> findProfilesOfficer() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/profiles/officer',
      );
      if (response.statusCode == 200) {
        return ProfilesOfficerEntity.fromJson(
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
