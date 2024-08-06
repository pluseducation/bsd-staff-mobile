import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/dashboard-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:dio/dio.dart';

class DashboardApi extends BaseApi {
  DashboardApi({required super.baseUrl});

  Future<int> findTotalPatient({
    required String workFlowType,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/workflow/$workFlowType',
      );
      if (response.statusCode == 200) {
        return convertToInt(response.data);
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

  Future<StatYearEntity> findStatYear() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/stat/year',
      );
      if (response.statusCode == 200) {
        return StatYearEntity.fromJson(
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

  Future<StatPatientWeekEntity> findStatPatientWeek() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/stat/patient/week',
      );
      if (response.statusCode == 200) {
        return StatPatientWeekEntity.fromJson(
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

  Future<StatPatientMonthEntity> findStatPatientMonth() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/stat/patient/month',
      );
      if (response.statusCode == 200) {
        return StatPatientMonthEntity.fromJson(
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

  Future<int> findTotalRetention() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/retentions',
      );
      if (response.statusCode == 200) {
        return convertToInt(response.data);
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

  Future<int> findpatients() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/patients',
      );
      if (response.statusCode == 200) {
        return convertToInt(response.data);
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

  Future<ReferEntity> findTotalRefer() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/dashboards/refer',
      );
      if (response.statusCode == 200) {
        return ReferEntity.fromJson(response.data as Map<String, dynamic>);
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
