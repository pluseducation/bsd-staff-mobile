import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/register-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class OtpApi extends BaseApi {
  OtpApi({required super.baseUrl});

  Future<OtpEntity> findOtp({
    required String phone,
    required String reqAuthenToken,
  }) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(reqAuthenToken);
      final response = await dio.get(
        '/otps?phone=$phone',
      );

      if (response.statusCode == 200) {
        return OtpEntity.fromJson(
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

  Future<bool> updateUsersession({required bool complete}) async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.put("/usersessions/mobile?complete=$complete");
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

  Future<ConfirmOtpEntity> confirmOtp({
    required String phone,
    required String refNo,
    required String token,
    required String pin,
    required String reqAuthenToken,
  }) async {
    try {
      final Dio dio = await getPrivateWithTokenDio(
        reqAuthenToken,
      );
      final response = await dio.put(
        '/otps',
        data: {
          'phone': phone,
          'refNo': refNo,
          'token': token,
          'pin': pin,
        },
      );

      if (response.statusCode == 200) {
        return ConfirmOtpEntity.fromJson(
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
