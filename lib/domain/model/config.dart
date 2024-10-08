import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';

@freezed
class Config with _$Config {
  const factory Config({
    required String baseUrl,
    required String baseAuthUrl,
  }) = _Config;
}
