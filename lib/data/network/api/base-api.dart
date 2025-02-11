import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  late final Dio _dio;
  final String baseUrl;

  BaseApi({required this.baseUrl}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio = Dio(options);
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // You can add headers here if needed
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle the response
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
            // Navigate to login screen if 401 error occurs
            //getIt<NavigationService>().navigateToReplacement('/login');
          }
          return handler.next(error);
        },
      ),
    );
  }

  @protected
  Future<Dio> getDio() async {
    return _dio;
  }

  @protected
  Future<Dio> getPrivateDio() async {
    final preferences =
        Preferences(prefs: await SharedPreferences.getInstance());
    final token = await preferences.getAccessToken();
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // You can add headers here if needed
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle the response
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
            // Navigate to login screen if 401 error occurs
            getIt<NavigationService>().navigateToReplacement('/login');
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  @protected
  Future<Dio> getPrivateWithTokenDio(String token) async {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    return Dio(options)
      ..options.headers = {
        'Authorization': 'Bearer $token',
      }
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }
}
