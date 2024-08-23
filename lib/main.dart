import 'dart:convert';

import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:bst_staff_mobile/data/network/api/appointments-api.dart';
import 'package:bst_staff_mobile/data/network/api/certificate-api.dart';
import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screenings-api.dart';
import 'package:bst_staff_mobile/data/network/api/usersession-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/config.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/presentation/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class InitialData {
  final List<SingleChildWidget> providers;

  InitialData({required this.providers});
}

final getIt = GetIt.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: avoid_redundant_argument_values,  deprecated_member_use
  await Sqflite.devSetDebugModeOn(kDebugMode);

  final data = await _createData();

  getIt.registerSingleton<NavigationService>(NavigationService());
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

  // Services
  final preferences = Preferences(prefs: await SharedPreferences.getInstance());
  final preferencesRepo = PreferencesRepository(preferences: preferences);
  final appService = AppService(preferencesRepo: preferencesRepo);
  await appService.load();

  // Data
  final networkMapper = NetworkMapper(log: log);
  final loginApi = LoginApi(baseUrl: config.baseAuthUrl);
  final otpApi = OtpApi(baseUrl: config.baseAuthUrl);
  final loginRepository = LoginRepository(
    loginApi: loginApi,
    otpApi: otpApi,
    networkMapper: networkMapper,
  );
  final dashboardApi = DashboardApi(baseUrl: config.baseUrl);
  final userSessionApi = UserSessionApi(baseUrl: config.baseAuthUrl);

  final dashboardRepository = DashboardRepository(
    dashboardApi: dashboardApi,
    userSessionApi: userSessionApi,
    networkMapper: networkMapper,
  );
  final patientApi = PatientApi(baseUrl: config.baseUrl);
  final patientRepository = PatientRepository(
    patientApi: patientApi,
    networkMapper: networkMapper,
  );

  final masterApi = MasterApi(baseUrl: config.baseUrl);
  final questionApi = Question(baseUrl: config.baseUrl);
  final screeningsApi = Screenings(baseUrl: config.baseUrl);

  final workflowRepository = WorkflowRepository(
    patientApi: patientApi,
    masterApi: masterApi,
    questionApi: questionApi,
    networkMapper: networkMapper,
    screeningsApi: screeningsApi,
  );

  final appointmentsApi = Appointments(baseUrl: config.baseUrl);

  final appointmentsRepository = AppointmentsRepository(
    appointmentsApi: appointmentsApi,
    masterApi: masterApi,
    networkMapper: networkMapper,
  );

  final certificateApi = CertificateApi(baseUrl: config.baseUrl);
  final certificateRepository = CertificateRepository(
    certificateApi: certificateApi,
    networkMapper: networkMapper,
  );

  // Create list of providers
  return InitialData(
    providers: [
      Provider<Logger>.value(value: log),
      Provider<LoginRepository>.value(value: loginRepository),
      Provider<DashboardRepository>.value(value: dashboardRepository),
      Provider<PatientRepository>.value(value: patientRepository),
      Provider<WorkflowRepository>.value(value: workflowRepository),
      Provider<AppointmentsRepository>.value(value: appointmentsRepository),
      Provider<CertificateRepository>.value(value: certificateRepository),
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
        baseAuthUrl: config['baseAuthUrl'] as String);
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
