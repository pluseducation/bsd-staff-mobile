import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  late final Dio _dio;
  final String baseUrl;

  BaseApi({required this.baseUrl}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    _dio = Dio(options)
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
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
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
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
