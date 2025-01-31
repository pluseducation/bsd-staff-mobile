import 'dart:convert';
import 'dart:io';

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
        '/api/v1/staff/officers/$officerId',
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

  Future<bool> updateProfile({
    required ProfileEntity entityProfile,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.put(
        '/api/v1/staff/officers',
        data: {
          'username': entityProfile.username,
          'password': password,
          'confirmPassword': confirmPassword,
          'name': entityProfile.nameTh,
          'surname': entityProfile.surnameTh,
          'nationalId': entityProfile.nationalId,
          'email': entityProfile.email,
          'phoneNo': entityProfile.phoneNo,
          'roleId': entityProfile.roleId,
          'subDivisionId': entityProfile.subDivisionId,
          'officerId': entityProfile.officerId,
          'active': entityProfile.active,
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

  Future<ProfileOfficerEntity> findProfileOfficer() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/profiles/officer',
      );
      if (response.statusCode == 200) {
        return ProfileOfficerEntity.fromJson(
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

  Future<bool> uploadImage({
    required File file,
  }) async {
    try {
      final fileNameOrg = file.path.split('/').last;
      final bytes = await file.readAsBytes();
      final contentBase64 = base64Encode(bytes);

      final Dio dio = await getPrivateDio();
      final response = await dio.post(
        "/api/v1/staff/profiles/image",
        data: {
          'fileNameOrg': fileNameOrg,
          'content': contentBase64,
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
