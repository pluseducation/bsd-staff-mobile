import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class WorkflowRepository {
  final PatientApi patientApi;
  final MasterApi masterApi;
  final Question questionApi;
  final NetworkMapper networkMapper;

  WorkflowRepository({
    required this.patientApi,
    required this.masterApi,
    required this.questionApi,
    required this.networkMapper,
  });

  Future<void> findRegistering(int id) async {
    try {
      final entityPatient = await patientApi.findPatient(id, patientsid: id);
      final entityProfile = await patientApi.findProfile(id, patientsid: id);
      final entityNationallity = await masterApi.findNationality();
      final entityReligion = await masterApi.findReligions();
      final entityRelationShip = await masterApi.findRelationships();
      final entityQuestion = await questionApi.findRegisteringQuestionChoices();

      final String fullname =
          "${convertToString(entityPatient.name)} ${convertToString(entityPatient.surname)}";
      final String patientStatus = convertToString(entityProfile.patientStatus);
      final String level = convertToString(entityProfile.level);
      final String dateOfBirthText = entityPatient.dateOfBirth.toString();

      final String nationalityText = convertToString(
        entityNationallity
            .where((t) => t.id == entityPatient.nationalityId)
            .first
            .name,
      );

      final String religionText = convertToString(
        entityReligion
            .where((t) => t.id == entityPatient.religionId)
            .first
            .name,
      );

      final String registereText =
          "${entityPatient.registeredHouseNo} ${entityPatient.registeredHouseMoo} ${entityPatient.registeredVillageId}${entityPatient.registeredHouseRoad}${entityPatient.registeredProvinceId}${entityPatient.registeredDistrictId}${entityPatient.registeredSubDistrictId}${entityPatient.registeredPostalCode}";
      final String currentAddrText =
          "${entityPatient.currentAddrAsRegistered} ${entityPatient.currentHouseNo} ${entityPatient.currentHouseMoo} ${entityPatient.currentVillageId} ${entityPatient.currentHouseRoad} ${entityPatient.currentProvinceId} ${entityPatient.currentDistrictId}  ${entityPatient.currentSubDistrictId} ${entityPatient.currentPostalCode}";
      final String guardianfullNameText =
          "${entityPatient.guardianName} ${entityPatient.guardianSurname}";

      final String relationShipId = convertToString(
        entityRelationShip
            .where((t) => t.id == entityPatient.relationShipId)
            .first
            .name,
      );

      final String gender = convertToString(
        entityQuestion
            .firstWhere(
              (q) => q.question?.question == "gender",
              orElse: () => throw Exception("Gender question not found"),
            )
            .choices
            ?.firstWhere(
              (choice) => choice.choice == entityPatient.gender,
              orElse: () => throw Exception("Gender choice not found"),
            )
            .desc,
      );

      print(gender);

      // final String? gender = entityQuestion.isNotEmpty
      //     ? entityQuestion[0].gender.toString()
      //     : entityQuestion.isNotEmpty
      //         ? entityQuestion[1].toString()
      //         : null;

      // final String? joinTreatmentByText = entityQuestion.isNotEmpty
      //     ? entityQuestion[0].someStringField.toString()
      //     : null;

      // final String? joinSentByCourtText = entityQuestion.isNotEmpty
      //     ? entityQuestion[0].someStringField.toString()
      //     : null;
    } catch (e) {
      rethrow;
    }
  }
}
