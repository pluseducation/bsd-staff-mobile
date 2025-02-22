import 'package:freezed_annotation/freezed_annotation.dart';

part 'config-server.freezed.dart';

@freezed
class UpdateApp with _$UpdateApp {
  const factory UpdateApp({
    required String iosVersion,
    required String iosUpdateUrl,
    required String iosIsDeploy,
    required String androidVersion,
    required String androidUpdateUrl,
    required String androidIsDeploy,
  }) = _UpdateApp;
}
