import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/profile-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class ProfileApi extends BaseApi {
  ProfileApi({required super.baseUrl});

  Future<ProfileEntity> findProfile({
    required int officerId,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/officers/$officerId',
      );
      if (response.statusCode == 200) {
        return ProfileEntity.fromJson(
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

  Future<ProfileUpdateEntity> findProfileUpdate({
    required String username,
    required String password,
    required String confirmPassword,
    required String name,
    required String surname,
    required String nationalId,
    required String email,
    required String phoneNo,
    required int roleId,
    required int subDivisionId,
    required int officerId,
    required bool active,
    required bool resetPassword,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.put(
        '/api/v1/officers',
        data: {
          'username': username,
          'password': password,
          'confirmPassword': confirmPassword,
          'name': name,
          'surname': surname,
          'nationalId': nationalId,
          'email': email,
          'phoneNo': phoneNo,
          'roleId': roleId,
          'subDivisionId': subDivisionId,
          'officerId': officerId,
          'active': active,
          'resetPassword': resetPassword,
        },
      );

      if (response.statusCode == 200) {
        return ProfileUpdateEntity.fromJson(
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
