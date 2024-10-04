import 'package:bst_staff_mobile/data/network/api/config-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/config-server.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class ConfigRepository {
  final ConfigApi configApi;
  final NetworkMapper networkMapper;

  ConfigRepository({
    required this.configApi,
    required this.networkMapper,
  });

  Future<ConfigServer> loadConfig() async {
    final entity = await configApi.loadConfig();
    ;
    final config = ConfigServer(
      iosVersion: convertToString(entity.iosVersion),
      iosUpdateUrl: convertToString(entity.iosUpdateUrl),
      iosIsDeploy: convertToString(entity.iosIsDeploy),
      androidVersion: convertToString(entity.androidVersion),
      androidUpdateUrl: convertToString(entity.androidUpdateUrl),
      androidIsDeploy: convertToString(entity.androidIsDeploy),
    );
    return config;
  }
}
