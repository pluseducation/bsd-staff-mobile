import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/patient-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:dio/dio.dart';

class PatientApi extends BaseApi {
  PatientApi({required super.baseUrl});

  Future<PatientAllEntity> findPatientAll(
    SearchPatient search,
  ) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': search.page,
        'size': search.size,
      };

      if (search.searchVal.isNotEmpty) {
        queryParameters['searchVal'] = search.searchVal;
      }

      if (search.workFlowStatus.isNotEmpty) {
        queryParameters['statuses'] =
            search.workFlowStatus.map((status) => status.value).toList();
      }

      if (search.levelTypes.isNotEmpty) {
        queryParameters['levels'] =
            search.levelTypes.map((levelType) => levelType.value).toList();
      }

      if (search.drugEvalResults.isNotEmpty) {
        queryParameters['drugEvalResults'] = search.drugEvalResults
            .map((drugEvalResult) => drugEvalResult.value)
            .toList();
      }

      if (search.treatmentTypes.isNotEmpty) {
        queryParameters['treatmentTypes'] = search.treatmentTypes
            .map((treatmentType) => treatmentType.value)
            .toList();
      }

      if (search.smivTypes.isNotEmpty) {
        queryParameters['smiv'] =
            search.smivTypes.map((smivType) => smivType.value).toList();
      }

      final response = await dio.get(
        '/api/v1/staff/patients?',
        queryParameters: queryParameters,
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

  Future<RegisteringEntity> findPatient(int patientsid) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/patients/$patientsid',
      );
      if (response.statusCode == 200) {
        return RegisteringEntity.fromJson(
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

  Future<List<PatientHistoryEntity>> findPatientHistory(
    SearchPatientHistory search,
  ) async {
    try {
      final Map<String, dynamic> queryParameters = {};

      if (search.type == "NAME") {
        queryParameters['name'] = search.name;
        queryParameters['surname'] = search.surname;
      } else if (search.type == "NATIONAL_ID") {
        queryParameters['nationalId'] = search.nationalId;
      } else if (search.type == "CYCLE") {
        queryParameters['cycle'] = search.cycle;
      }

      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/patients/history',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return PatientHistoryEntity.fromJsons(
          response.data as List,
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
