import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/refer-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/refer.dart';
import 'package:dio/dio.dart';

class SenderApi extends BaseApi {
  SenderApi({required super.baseUrl});

  Future<SenderEntity> findRefer({
    required SearchSender searchSender,
  }) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': searchSender.page,
        'size': searchSender.size,
        'sort': 'referDate,DESC',
      };

      if (searchSender.searchVal.isNotEmpty) {
        queryParameters['searchVal'] = searchSender.searchVal;
      }

      if (searchSender.referStatus.isNotEmpty) {
        queryParameters['statuses'] =
            searchSender.referStatus.map((status) => status.value).toList();
      }

      final response = await dio.get(
        '/api/v1/staff/refers/sender?',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return SenderEntity.fromJson(
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

class ReceiverApi extends BaseApi {
  ReceiverApi({required super.baseUrl});

  Future<ReceiverEntity> findReceiver({
    required SearchReceiver searchReceiver,
  }) async {
    try {
      final Dio dio = await getPrivateDio();

      final Map<String, dynamic> queryParameters = {
        'page': searchReceiver.page,
        'size': searchReceiver.size,
      };

      if (searchReceiver.searchVal.isNotEmpty) {
        queryParameters['searchVal'] = searchReceiver.searchVal;
      }

      if (searchReceiver.referStatus.isNotEmpty) {
        queryParameters['statuses'] =
            searchReceiver.referStatus.map((status) => status.value).toList();
      }

      final response = await dio.get(
        '/api/v1/staff/refers/receiver?',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return ReceiverEntity.fromJson(
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
