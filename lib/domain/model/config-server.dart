import 'package:freezed_annotation/freezed_annotation.dart';

part 'config-server.freezed.dart';

@freezed
class ConfigServer with _$ConfigServer {
  const factory ConfigServer({
    required String iosVersion,
    required String iosUpdateUrl,
    required String iosIsDeploy,
    required String androidVersion,
    required String androidUpdateUrl,
    required String androidIsDeploy,
  }) = _ConfigServer;
}
