import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class Question extends BaseApi {
  Question({required super.baseUrl});

  // ---------------------------------

  Future<List<QuestionChoicesEntity>> findQuestionChoices({
    required String findbyworkflowtype,
  }) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get(
        '/api/v1/questionchoices$findbyworkflowtype',
      );
      if (response.statusCode == 200) {
        return questionChoicesEntityFromJson(
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
