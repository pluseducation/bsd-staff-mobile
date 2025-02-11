import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/assistance-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:dio/dio.dart';

class AssistanceApi extends BaseApi {
  AssistanceApi({required super.baseUrl});

  Future<AssistanceAllEntity> findAssistance({
    required SearchAssistance searchAssistance,
  }) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': searchAssistance.page,
        'size': searchAssistance.size,
      };

      if (searchAssistance.searchVal.isNotEmpty) {
        queryParameters['searchVal'] = searchAssistance.searchVal;
      }

      if (searchAssistance.assistanceStatus.isNotEmpty) {
        queryParameters['statuses'] = searchAssistance.assistanceStatus
            .map((status) => status.value)
            .toList();
      }

      final response = await dio.get(
        '/api/v1/staff/assistances?',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return AssistanceAllEntity.fromJson(
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
  // ---------------------------------
}
