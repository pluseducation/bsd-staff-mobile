import 'dart:convert';

import 'package:bst_staff_mobile/data/database/dao/login-dao.dart';
import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:bst_staff_mobile/data/network/api/appointment-api.dart';
import 'package:bst_staff_mobile/data/network/api/assistance-api.dart';
import 'package:bst_staff_mobile/data/network/api/certificate-api.dart';
import 'package:bst_staff_mobile/data/network/api/config-api.dart';
import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/api/file-api.dart';
import 'package:bst_staff_mobile/data/network/api/login-api.dart';
import 'package:bst_staff_mobile/data/network/api/monitoring-api.dart';
import 'package:bst_staff_mobile/data/network/api/notification-api.dart';
import 'package:bst_staff_mobile/data/network/api/notification-config-api.dart';
import 'package:bst_staff_mobile/data/network/api/officer-api.dart';
import 'package:bst_staff_mobile/data/network/api/otp-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/profile-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/refer-api.dart';
import 'package:bst_staff_mobile/data/network/api/register-api.dart';
import 'package:bst_staff_mobile/data/network/api/screening-api.dart';
import 'package:bst_staff_mobile/data/network/api/treatment-api.dart';
import 'package:bst_staff_mobile/data/network/api/user-api.dart';
import 'package:bst_staff_mobile/data/network/api/usersession-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/data/repository/appointment-repository.dart';
import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/data/repository/config-repository.dart';
import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/data/repository/forgot-repository.dart';
import 'package:bst_staff_mobile/data/repository/home-repository.dart';
import 'package:bst_staff_mobile/data/repository/login-repository.dart';
import 'package:bst_staff_mobile/data/repository/notification-config-repository.dart';
import 'package:bst_staff_mobile/data/repository/notification-repository.dart';
import 'package:bst_staff_mobile/data/repository/officer-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-history-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/data/repository/pin-repository.dart';
import 'package:bst_staff_mobile/data/repository/preferences-repository.dart';
import 'package:bst_staff_mobile/data/repository/profile-repository.dart';
import 'package:bst_staff_mobile/data/repository/refer-repository.dart';
import 'package:bst_staff_mobile/data/repository/register-repository.dart';
import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/config.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/domain/service/notifi_service.dart';
import 'package:bst_staff_mobile/presentation/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
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
  getIt.registerSingleton<NavigationService>(NavigationService());

  //disabl e landscape mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final data = await _createData();

  // firebase
  await Firebase.initializeApp();
  MessageService().initialize();

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
  final configApi = ConfigApi(baseUrl: config.baseUrl);
  final loginApi = LoginApi(baseUrl: config.baseAuthUrl);
  final userApi = UserApi(baseUrl: config.baseAuthUrl);
  final registerApi = RegisterApi(baseUrl: config.baseAuthUrl);
  final officerApi = OfficerApi(baseUrl: config.baseUrl);
  final otpApi = OtpApi(baseUrl: config.baseAuthUrl);
  final fileApi = FileApi(baseUrl: config.baseUrl);
  final userSessionApi = UserSessionApi(baseUrl: config.baseAuthUrl);

  // Database
  final loginDao = LoginDao();

  final configRepository = ConfigRepository(
    configApi: configApi,
    networkMapper: networkMapper,
  );

  final loginRepository = LoginRepository(
    loginApi: loginApi,
    loginDao: loginDao,
    officerApi: officerApi,
    otpApi: otpApi,
    userSessionApi: userSessionApi,
    userApi: userApi,
    networkMapper: networkMapper,
  );

  final registerRepository = RegisterRepository(
    registerApi: registerApi,
    otpApi: otpApi,
  );

  final preferences = Preferences(prefs: await SharedPreferences.getInstance());
  final preferencesRepo = PreferencesRepository(preferences: preferences);
  final appService = AppService(
    preferencesRepo: preferencesRepo,
    loginRepository: loginRepository,
    configRepository: configRepository,
  );
  await appService.load();

  final dashboardApi = DashboardApi(baseUrl: config.baseUrl);

  final homeRepository = HomeRepository(
    dashboardApi: dashboardApi,
    userSessionApi: userSessionApi,
    networkMapper: networkMapper,
  );

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

  final patientHistoryRepository = PatientHistoryRepository(
    patientApi: patientApi,
    networkMapper: networkMapper,
  );

  final assistanceApi = AssistanceApi(baseUrl: config.baseUrl);
  final assistanceRepository = AssistanceRepository(
    assistanceApi: assistanceApi,
    networkMapper: networkMapper,
  );

  final referApi = ReferApi(baseUrl: config.baseUrl);
  final referRepository = ReferRepository(
    referApi: referApi,
    networkMapper: networkMapper,
  );

  final questionApi = Question(baseUrl: config.baseUrl);
  final screeningApi = ScreeningApi(baseUrl: config.baseUrl);
  final treatmentApi = TreatmentApi(baseUrl: config.baseUrl);
  final monitoringApi = MonitoringApi(baseUrl: config.baseUrl);

  final workflowRepository = WorkflowRepository(
    patientApi: patientApi,
    questionApi: questionApi,
    networkMapper: networkMapper,
    screeningApi: screeningApi,
    treatmentApi: treatmentApi,
    monitoringApi: monitoringApi,
  );

  final appointmentsApi = AppointmentApi(baseUrl: config.baseUrl);

  final appointmentRepository = AppointmentRepository(
    appointmentsApi: appointmentsApi,
    networkMapper: networkMapper,
  );

  final certificateApi = CertificateApi(baseUrl: config.baseUrl);
  final certificateRepository = CertificateRepository(
    certificateApi: certificateApi,
    fileApi: fileApi,
    networkMapper: networkMapper,
  );

  final officerRepository = OfficerRepository(
    officerApi: officerApi,
    networkMapper: networkMapper,
  );

  final profileApi = ProfileApi(baseUrl: config.baseUrl);
  final profileRepository = ProfileRepository(
    profileApi: profileApi,
    userApi: userApi,
    networkMapper: networkMapper,
    baseUrl: config.baseUrl,
  );

  final notificationConfigApi = NotificationConfigApi(baseUrl: config.baseUrl);
  final notificationConfigRepository = NotificationConfigRepository(
    notificationConfigApi: notificationConfigApi,
    networkMapper: networkMapper,
  );

  final notificationApi = NotificationApi(baseUrl: config.baseUrl);
  final notificationRepository = NotificationRepository(
    notificationApi: notificationApi,
    networkMapper: networkMapper,
  );

  final pinRepository = PinRepository(
    userApi: userApi,
    loginDao: loginDao,
  );

  final forgotRepository = ForgotRepository(
    userApi: userApi,
    otpApi: otpApi,
    loginDao: loginDao,
  );

  // Create list of providers
  return InitialData(
    providers: [
      Provider<Logger>.value(value: log),
      Provider<ConfigRepository>.value(value: configRepository),
      Provider<LoginRepository>.value(value: loginRepository),
      Provider<RegisterRepository>.value(value: registerRepository),
      Provider<HomeRepository>.value(value: homeRepository),
      Provider<DashboardRepository>.value(value: dashboardRepository),
      Provider<PatientRepository>.value(value: patientRepository),
      Provider<PatientHistoryRepository>.value(value: patientHistoryRepository),
      Provider<WorkflowRepository>.value(value: workflowRepository),
      Provider<AppointmentRepository>.value(value: appointmentRepository),
      Provider<CertificateRepository>.value(value: certificateRepository),
      Provider<OfficerRepository>.value(value: officerRepository),
      Provider<ProfileRepository>.value(value: profileRepository),
      Provider<NotificationConfigRepository>.value(
        value: notificationConfigRepository,
      ),
      Provider<AssistanceRepository>.value(value: assistanceRepository),
      Provider<NotificationRepository>.value(value: notificationRepository),
      Provider<AssistanceRepository>.value(value: assistanceRepository),
      Provider<ReferRepository>.value(value: referRepository),
      Provider<PinRepository>.value(value: pinRepository),
      Provider<ForgotRepository>.value(value: forgotRepository),
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
