import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/notification-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/notification-app.dart';
import 'package:dio/dio.dart';

class NotificationApi extends BaseApi {
  NotificationApi({required super.baseUrl});

  Future<NotificationEntity> findAll(SearchNotification search) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': search.page,
        'size': search.size,
      };

      final response = await dio.get(
        '/api/v1/staff/notifications',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return NotificationEntity.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.data as String,
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

  Future<void> updateAcknowledged(int id) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.patch(
        "/api/v1/staff/notifications/acknowledged/$id",
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
}
