import 'dart:convert';

import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/domain/model/config.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class InitialData {
  final List<SingleChildWidget> providers;

  InitialData({required this.providers});
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: avoid_redundant_argument_values,  deprecated_member_use
  await Sqflite.devSetDebugModeOn(kDebugMode);

  final data = await _createData();

  runApp(App(data: data));
}

Future<InitialData> _createData() async {
  // Util
  final log = Logger(
    printer: PrettyPrinter(),
    level: kDebugMode ? Level.trace : Level.off,
  );

  // Load project configuration
  final config = await _loadConfig(log);

  // Data
  final networkMapper = NetworkMapper(log: log);
  final loginApi = LoginApi(baseUrl: config.baseUrl);
  final loginRepository = LoginRepository(
    loginApi: loginApi,
    networkMapper: networkMapper,
  );
  final dashboardApi = DashboardApi(baseUrl: config.baseUrl);
  final dashboardRepository = DashboardRepository(
    dashboardApi: dashboardApi,
    networkMapper: networkMapper,
  );
  final patientApi = PatientApi(baseUrl: config.baseUrl);
  final patientRepository = PatientRepository(
    patientApi: patientApi,
    networkMapper: networkMapper,
  );

  final preferences = Preferences(prefs: await SharedPreferences.getInstance());
  final preferencesRepo = PreferencesRepository(preferences: preferences);

  // Services
  final appService = AppService(preferencesRepo: preferencesRepo);
  await appService.load();

  // Create list of providers
  return InitialData(
    providers: [
      Provider<Logger>.value(value: log),
      Provider<LoginRepository>.value(value: loginRepository),
      Provider<DashboardRepository>.value(value: dashboardRepository),
      Provider<PatientRepository>.value(value: patientRepository),
      ChangeNotifierProvider<AppService>.value(value: appService),
    ],
  );
}

Future<Config> _loadConfig(Logger log) async {
  String raw;

  try {
    raw = await rootBundle.loadString('assets/config/config.json');

    final config = json.decode(raw) as Map<String, dynamic>;

    return Config(
      baseUrl: config['baseUrl'] as String,
    );
  } catch (e) {
    log.e(
      'Error while loading project configuration, please make sure '
      'that the file located at /assets/config/config.json '
      'exists and that it contains the correct configuration.',
      error: e,
    );
    rethrow;
  }
}
