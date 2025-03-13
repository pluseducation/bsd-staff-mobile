import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class PatientRepository {
  final PatientApi patientApi;
  final NetworkMapper networkMapper;

  PatientRepository({
    required this.patientApi,
    required this.networkMapper,
  });

  Future<List<Patient>> findPatientAll({
    required SearchPatient search,
  }) async {
    final entity = await patientApi.findPatientAll(search);

    // set search
    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // set model
    final models = entity.content.map((item) {
      final fullname =
          "${convertToString(item.name)} ${convertToString(item.surname)}";

      final nationalId = item.generatedId != null
          ? '${item.generatedId} (แทน)'
          : convertToString(item.nationalId);

      return Patient(
        patientId: item.patientId,
        fullName: fullname,
        nationalId: nationalId,
        cycle: convertToString(item.cycle),
        workFlowStatus: WorkFlowStatus.setValue(item.status),
        drugEvalResult: DrugEvalResult.setValue(item.drugEval),
        levelType: LevelType.setValue(item.level),
        treatmentType: TreatmentType.setValue(item.treatmentType),
        smivType: SmivType.setValue(item.smiv),
      );
    }).toList();

    return models;
  }
}
