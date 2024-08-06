import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/api/usersession-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/model/session.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class DashboardRepository {
  final DashboardApi dashboardApi;
  final UserSessionApi userSessionApi;
  final NetworkMapper networkMapper;

  DashboardRepository({
    required this.dashboardApi,
    required this.userSessionApi,
    required this.networkMapper,
  });

  // TODO : user session
  Future<Session> findUserSession() async {
    final entity = await userSessionApi.findUsersession();
    final model = networkMapper.toUserSession(entity);
    return model;
  }

  Future<void> updateUserSession(bool complete) async {
    await userSessionApi.updateUsersession(complete: complete);
  }

  Future<int> findTotalRegistering() async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "REGISTERING");
    return value;
  }

  Future<int> findTotalScreening({
    required String username,
    required String password,
  }) async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "SCREENING");
    return value;
  }

  Future<int> findTotalTreatment() async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "TREATMENT");
    return value;
  }

  Future<int> findTotalMonitoring() async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "MONITORING");
    return value;
  }

  Future<int> findTotalAssistance() async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "ASSISTANCE");
    return value;
  }

  Future<int> findTotalDischarged() async {
    final value =
        await dashboardApi.findTotalPatient(workFlowType: "DISCHARGED");
    return value;
  }

  Future<StatYear> findStatYear() async {
    final entity = await dashboardApi.findStatYear();
    final model = networkMapper.toStatYear(entity);

    return model;
  }

  Future<StatPatientWeek> findStatPatientWeek() async {
    final entity = await dashboardApi.findStatPatientWeek();
    final List<double> dataWeek = [];
    dataWeek.add(convertToDouble(entity.monday));
    dataWeek.add(convertToDouble(entity.tuesday));
    dataWeek.add(convertToDouble(entity.wednesday));
    dataWeek.add(convertToDouble(entity.thursday));
    dataWeek.add(convertToDouble(entity.friday));
    dataWeek.add(convertToDouble(entity.saturday));
    dataWeek.add(convertToDouble(entity.sunday));
    final model = networkMapper.toStatPatientWeek(
      entity,
      dataWeek,
    );

    return model;
  }

  Future<StatPatientMonth> findStatPatientMonth() async {
    final entity = await dashboardApi.findStatPatientMonth();
    final List<double> dataMonth = [];

    for (final total in entity.totals) {
      dataMonth.add(convertToDouble(total.total));
    }

    final model = networkMapper.toStatPatientMonth(
      entity,
      dataMonth,
    );

    return model;
  }

  Future<int> findTotalRetention() async {
    final value = await dashboardApi.findTotalRetention();
    return value;
  }

  Future<int> findpatients() async {
    final value = await dashboardApi.findpatients();
    return value;
  }

  Future<Refer> findTotalRefer() async {
    final entity = await dashboardApi.findTotalRefer();
    final model = networkMapper.toRefer(entity);
    return model;
  }
}
