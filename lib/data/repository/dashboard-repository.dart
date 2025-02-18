import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/api/usersession-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
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

  Future<int> findTotalPatientDashboard() async {
    final value = await dashboardApi.findTotalPatientDashboard();
    return value;
  }

  Future<double> findRetentionDashboard() async {
    final value = await dashboardApi.findRetentionDashboard();
    return value;
  }

  Future<WorkFlowCount> findWorkflowDashboard() async {
    final entities = await dashboardApi.findWorkflowDashboard();
    int countRegistering = 0;
    int countScreening = 0;
    int countTreatment = 0;
    int countMonitoring = 0;
    int countAssistance = 0;
    int countDischarged = 0;

    for (final entity in entities) {
      if (entity.workflow == "REGISTERING") {
        countRegistering = convertToInt(entity.count);
      } else if (entity.workflow == "SCREENING") {
        countScreening = convertToInt(entity.count);
      } else if (entity.workflow == "TREATMENT") {
        countTreatment = convertToInt(entity.count);
      } else if (entity.workflow == "MONITORING") {
        countMonitoring = convertToInt(entity.count);
      } else if (entity.workflow == "ASSISTANCE") {
        countAssistance = convertToInt(entity.count);
      } else if (entity.workflow == "DISCHARGED") {
        countDischarged = convertToInt(entity.count);
      }
    }

    final model = WorkFlowCount(
      countRegistering: countRegistering,
      countScreening: countScreening,
      countTreatment: countTreatment,
      countMonitoring: countMonitoring,
      countAssistance: countAssistance,
      countDischarged: countDischarged,
    );

    return model;
  }

  Future<ReferCount> findReferDashboard() async {
    final entity = await dashboardApi.findReferDashboard();
    final model = ReferCount(
        receiver: convertToInt(entity.sender),
        sender: convertToInt(entity.receiver));
    return model;
  }

  // Future<StatYear> findStatYear() async {
  //   final entity = await dashboardApi.findStatYear();
  //   final model = networkMapper.toStatYear(entity);

  //   return model;
  // }

  // Future<int> findpatients() async {
  //   final value = await dashboardApi.findpatients();
  //   return value;
  // }

  // Future<Level> findLevel() async {
  //   final entity = await dashboardApi.findLevel();
  //   final model = networkMapper.toLevel(entity);
  //   return model;
  // }

  // Future<List<ReportData>> findReportData({
  //   required String name,
  //   required int districtId,
  //   required int healthServiceId,
  // }) async {
  //   final entitys = await dashboardApi.findReportData(
  //     name: name,
  //     districtId: districtId,
  //     healthServiceId: healthServiceId,
  //   );

  //   final models = entitys.map((entity) {
  //     final model = ReportData(
  //       name: convertToString(entity.name),
  //       register: convertToInt(entity.register).toString(),
  //       screening: convertToInt(entity.screening).toString(),
  //       treatment: convertToInt(entity.treatment).toString(),
  //       monitoring: convertToInt(entity.monitoring).toString(),
  //       retentionRate: convertToDouble(entity.retentionRate).toStringAsFixed(2),
  //       districtId: convertToInt(entity.districtId),
  //       healthServiceId: convertToInt(entity.healthServiceId),
  //     );
  //     return model;
  //   }).toList();

  //   return models;
  // }

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
    final model = StatPatientWeek(
      newPatientWeek: convertToInt(entity.newPatientWeek),
      dataWeek: dataWeek,
    );

    return model;
  }

  Future<StatPatientMonth> findStatPatientMonth() async {
    final entity = await dashboardApi.findStatPatientMonth();
    final List<double> dataMonth = [];

    for (final total in entity.totals) {
      dataMonth.add(convertToDouble(total.total));
    }

    final model = StatPatientMonth(
      newPatientMonth: convertToInt(entity.newPatientMonth),
      dataMonth: dataMonth,
    );

    return model;
  }
}
