import 'dart:convert';
import 'dart:io';

import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/certificate-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:dio/dio.dart';

class CertificateApi extends BaseApi {
  CertificateApi({required super.baseUrl});

  Future<CertificateEntity> findCertificateAll({
    required SearchCertificate searchCertificate,
  }) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': searchCertificate.page,
        'size': searchCertificate.size,
      };

      if (searchCertificate.name.isNotEmpty) {
        queryParameters['name'] = searchCertificate.name;
      }

      final response = await dio.get(
        '/api/v1/staff/certificaterequests',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return CertificateEntity.fromJson(
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

  Future<CertificateDetailEntity> findCertificateById({
    required int certificateById,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/certificaterequests/$certificateById',
      );
      if (response.statusCode == 200) {
        return CertificateDetailEntity.fromJson(
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

  // Add this method put

  Future<bool> updateCertificateStatus({
    required int id,
    required String status,
    required File imageFile,
  }) async {
    try {
      final fileNameOrg = imageFile.path.split('/').last;
      final bytes = await imageFile.readAsBytes();
      final contentBase64 = base64Encode(bytes);

      final Dio dio = await getPrivateDio();
      final response = await dio.put(
        '/api/v1/staff/certificaterequests',
        data: {
          "id": id,
          "status": status,
          "file": {"fileNameOrg": fileNameOrg, "content": contentBase64},
        },
      );
      if (response.statusCode == 200) {
        return true;
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
