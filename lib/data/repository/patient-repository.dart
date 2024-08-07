import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
// import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/util/constant.dart';

class PatientRepository {
  final PatientApi patientApi;
  final NetworkMapper networkMapper;

  PatientRepository({
    required this.patientApi,
    required this.networkMapper,
  });

  Future<PatientAll> findPatientAll({
    required String searchVal,
    required int page,
  }) async {
    final entity = await patientApi.findPatientAll(
      searchVal: searchVal,
      page: page,
      size: Constant.size,
    );

    final model = networkMapper.toPatientAll(entity);
    return model;
  }
// --------------------------
}
