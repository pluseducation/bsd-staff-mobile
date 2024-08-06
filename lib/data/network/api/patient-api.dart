import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/patient-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class PatientApi extends BaseApi {
  PatientApi({required super.baseUrl});

  Future<PatientAllEntity> findPatientAll({
    required String searchVal,
    required int page,
    required int size,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/patients?searchVal=$searchVal&page=$page&size=$size',
      );
      if (response.statusCode == 200) {
        return PatientAllEntity.fromJson(response.data as Map<String, dynamic>);
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
  // ---------------------------------

  Future<WorkflowEntity> findPatientAllID({
    required int patientsid,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/patients$patientsid',
      );
      if (response.statusCode == 200) {
        return WorkflowEntity.fromJson(response.data as Map<String, dynamic>);
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
