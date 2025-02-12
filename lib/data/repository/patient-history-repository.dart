import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class PatientHistoryRepository {
  final PatientApi patientApi;
  final NetworkMapper networkMapper;

  PatientHistoryRepository({
    required this.patientApi,
    required this.networkMapper,
  });

  Future<List<PatientHistory>> findPatientHistory({
    required SearchPatientHistory search,
  }) async {
    final entity = await patientApi.findPatientHistory(search);

    // set model
    final models = entity.map((item) {
      return PatientHistory(
        no: convertToInt(item.no),
        cycle: convertToString(item.cycle),
        createdAt: formatDate(item.createdAt),
        subDivisionName: convertToString(item.subDivisionName),
        workFlowStatus: WorkFlowStatus.setValue(item.workflowType),
      );
    }).toList();

    return models;
  }
}
