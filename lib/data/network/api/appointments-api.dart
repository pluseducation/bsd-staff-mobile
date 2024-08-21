import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/appointments-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class Appointments extends BaseApi {
  Appointments({required super.baseUrl});

  Future<List<AppointmentsEntity>> findAppointments() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/appointments');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data
            .map((item) =>
                AppointmentsEntity.fromJson(item as Map<String, dynamic>))
            .toList();
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
      throw Exception('Unknown error: $error');
    }
  }
}
