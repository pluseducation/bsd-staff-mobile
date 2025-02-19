import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/dashboard-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:dio/dio.dart';

class DashboardApi extends BaseApi {
  DashboardApi({required super.baseUrl});

  Future<int> findTotalPatientDashboard() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/dashboard/count-by-fiscalyear',
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

  Future<double> findRetentionDashboard() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/dashboard/retentions',
      );
      if (response.statusCode == 200) {
        return convertToDouble(response.data);
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

  Future<List<WorkflowCountEntity>> findWorkflowDashboard() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/dashboard/workflow',
      );
      if (response.statusCode == 200) {
        return WorkflowCountEntity.fromJsons(
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

  Future<ReferCountEntity> findReferDashboard() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/dashboard/refer',
      );
      if (response.statusCode == 200) {
        return ReferCountEntity.fromJson(response.data as Map<String, dynamic>);
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

  Future<LevelEntity> findLevel() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/staff/dashboard/stat/level',
      );
      if (response.statusCode == 200) {
        return LevelEntity.fromJson(response.data as Map<String, dynamic>);
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
        '/api/v1/staff/dashboard/stat/patient/week',
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
        '/api/v1/staff/dashboard/stat/patient/month',
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
}

// Future<List<ReportDataEntity>> findReportData({
//   required String name,
//   required int districtId,
//   required int healthServiceId,
// }) async {
//   try {
//     final Map<String, dynamic> queryParams = {};

//     // Validate and add parameters conditionally
//     if (name.isNotEmpty) {
//       queryParams['name'] = name;
//     }
//     if (districtId > 0) {
//       queryParams['districtId'] = districtId;
//     }
//     if (healthServiceId > 0) {
//       queryParams['healthServiceId'] = healthServiceId;
//     }

//     final Dio dio = await getPrivateDio();
//     final response = await dio.get(
//       '/api/v1/staff/dashboard/report',
//       queryParameters: queryParams,
//     );
//     if (response.statusCode == 200) {
//       return reportDataFromJson(response.data as List);
//     } else {
//       throw Exception('Unknown error');
//     }
//   } on DioException catch (error) {
//     if (error.response != null) {
//       throw NetworkException(
//         statusCode: error.response?.statusCode,
//         message: error.response?.data.toString(),
//       );
//     } else {
//       throw NetworkException(
//         statusCode: 404,
//         message: "ไม่สามารถเชื่อมต่อ Internet ได้",
//       );
//     }
//   } catch (error) {
//     throw Exception('Unknown error : $error');
//   }
// }

// Future<int> findpatients() async {
//   try {
//     final Dio dio = await getPrivateDio();
//     final response = await dio.get(
//       '/api/v1/staff/dashboard/patients',
//     );
//     if (response.statusCode == 200) {
//       return convertToInt(response.data);
//     } else {
//       throw Exception('Unknown error');
//     }
//   } on DioException catch (error) {
//     if (error.response != null) {
//       throw NetworkException(
//         statusCode: error.response?.statusCode,
//         message: error.response?.data.toString(),
//       );
//     } else {
//       throw NetworkException(
//         statusCode: 404,
//         message: "ไม่สามารถเชื่อมต่อ Internet ได้",
//       );
//     }
//   } catch (error) {
//     throw Exception('Unknown error : $error');
//   }
// }

// Future<StatYearEntity> findStatYear() async {
//   try {
//     final Dio dio = await getPrivateDio();
//     final response = await dio.get(
//       '/api/v1/staff/dashboard/stat/year',
//     );
//     if (response.statusCode == 200) {
//       return StatYearEntity.fromJson(
//         response.data as Map<String, dynamic>,
//       );
//     } else {
//       throw Exception('Unknown error');
//     }
//   } on DioException catch (error) {
//     if (error.response != null) {
//       throw NetworkException(
//         statusCode: error.response?.statusCode,
//         message: error.response?.data.toString(),
//       );
//     } else {
//       throw NetworkException(
//         statusCode: 404,
//         message: "ไม่สามารถเชื่อมต่อ Internet ได้",
//       );
//     }
//   } catch (error) {
//     throw Exception('Unknown error : $error');
//   }
//}
