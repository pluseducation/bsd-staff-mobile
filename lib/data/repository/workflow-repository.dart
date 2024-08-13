import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screenings-api.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-screen.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:intl/intl.dart';

class WorkflowRepository {
  final PatientApi patientApi;
  final Screenings screeningsApi;
  final MasterApi masterApi;
  final Question questionApi;
  final NetworkMapper networkMapper;

  WorkflowRepository({
    required this.patientApi,
    required this.screeningsApi,
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
      final entityVillages = await masterApi.findVillages();
      final entityProvinces = await masterApi.findProvinces();
      final entityDistricts = await masterApi.findDistricts();
      final entitySubdistricts = await masterApi.findSubdistricts();

      final entityQuestion = await questionApi.findRegisteringQuestionChoices();

      final String fullname =
          "${convertToString(entityPatient.name)} ${convertToString(entityPatient.surname)}";
      final String patientStatus = convertToString(entityProfile.patientStatus);
      final String level = convertToString(entityProfile.level);

      final String dateOfBirthText = formatThaiDate(entityPatient.dateOfBirth);

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

      // -----หมู่บ้าน/ชุมชน
      final String villages = convertToString(
        entityVillages
            .where((t) => t.id == entityPatient.registeredVillageId)
            .first
            .name,
      );

      // ----จังหวัด

      final String province = convertToString(
        entityProvinces
            .where((t) => t.id == entityPatient.registeredProvinceId)
            .first
            .name,
      );

      // ----เขต

      final String districts = convertToString(
        entityDistricts
            .where((t) => t.id == entityPatient.registeredDistrictId)
            .first
            .name,
      );

      // ตำบล
      final String subdistricts = convertToString(
        entitySubdistricts
            .where((t) => t.id == entityPatient.registeredSubDistrictId)
            .first
            .name,
      );

      final String registereText =
          "${entityPatient.registeredHouseNo} ${entityPatient.registeredHouseMoo} $villages ${entityPatient.registeredHouseRoad} $province $districts $subdistricts ${entityPatient.registeredPostalCode}";

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

      final String guardianPhoneNo = "${entityPatient.guardianPhoneNo}";

      final String gender = _getChoiceDescription(
        entityQuestion,
        "gender",
        entityPatient.gender,
      );

      String? joinTreatmentByText = "";
      joinTreatmentByText = _getChoiceDescription(
        entityQuestion,
        "join_treatment_by_prison",
        entityPatient.joinTreatmentBy,
      );

      if (joinTreatmentByText.isEmpty) {
        joinTreatmentByText = _getChoiceDescription(
          entityQuestion,
          "join_treatment_by_djop",
          entityPatient.joinTreatmentBy,
        );
      }

      if (joinTreatmentByText.isEmpty) {
        joinTreatmentByText = _getChoiceDescription(
          entityQuestion,
          "join_treatment_by",
          entityPatient.joinTreatmentBy,
        );
      }
      // --------------------------

      String? joinSentByCourtText = "";
      joinSentByCourtText = _getChoiceDescriptionChild(
        entityQuestion,
        "join_treatment_by_prison",
        entityPatient.joinSentByCourt,
      );

      if (joinSentByCourtText.isEmpty) {
        joinSentByCourtText = _getChoiceDescriptionChild(
          entityQuestion,
          "join_treatment_by_djop",
          entityPatient.joinSentByCourt,
        );
      }

      if (joinSentByCourtText.isEmpty) {
        joinSentByCourtText = _getChoiceDescriptionChild(
          entityQuestion,
          "join_treatment_by",
          entityPatient.joinSentByCourt,
        );
      }

      print("end");
      //----
    } catch (e) {
      rethrow;
    }
  }

  Future<void> findScreenings(int id) async {
    try {
      final entityScreenings =
          await screeningsApi.findScreenings(id, patientsid: id);

      final entityMaritalstatuses = await masterApi.findMaritalstatuses();
      final entityEducations = await masterApi.findEducations();
      final entityOccupations = await masterApi.findOccupations();
      final entityIncomes = await masterApi.findIncomes();

      final entityScreeningsQuestion =
          await questionApi.findScreeningsQuestionChoices();

      // final String maritalStatusId =
      //     convertToString(entityScreenings.maritalStatusId);

      final String entityMaritalstatusesText = convertToString(
        entityMaritalstatuses
            .where((t) => t.id == entityScreenings.maritalStatusId)
            .first
            .name,
      );
// -----
      final String entityEducationsText = convertToString(
        entityEducations
            .where((t) => t.id == entityScreenings.educationId)
            .first
            .name,
      );

      final String entityOccupationsText = convertToString(
        entityOccupations
            .where((t) => t.id == entityScreenings.occupationId)
            .first
            .name,
      );

      final String entityIncomesText = convertToString(
        entityIncomes
            .where((t) => t.id == entityScreenings.incomeId)
            .first
            .name,
      );

      final String livingWithLast30days = _getChoiceDescriptionList(
        entityScreeningsQuestion,
        "screening_info_last_30_days_answer",
        entityScreenings.livingWithLast30Days ?? [],
        "OTHER",
      );

      //----
    } catch (e) {
      rethrow;
    }
  }

  String _getChoiceDescriptionList(
    List<ScreeningsQuestionChoiceEntity> questionList,
    String question,
    List<AnswerEntity> answers,
    String otherKey,
  ) {
    final List<String> values = List.empty();

    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "";
    }

    final choiseEntitys = questionEntity.choices;
    if (choiseEntitys == null) {
      return "";
    }

    for (final answer in answers) {
      if (answer.answer == otherKey) {
        values.add(convertToString(answer.other));
      } else {
        final choiseEntity =
            choiseEntitys.where((t) => t.choice == answer.answer).firstOrNull;

        if (choiseEntity != null) {
          values.add(convertToString(choiseEntity.desc));
        }
      }
    }

    if (values.isEmpty) {
      return "";
    }

    return values.join(', ');
  }

  String _getChoiceDescription(
    List<QuestionChoicesEntity> questionList,
    String question,
    String? choice,
  ) {
    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "";
    }

    final choise =
        questionEntity.choices?.where((t) => t.choice == choice).firstOrNull;
    if (choise == null) {
      return "";
    }

    return convertToString(choise.desc);
  }

  String _getChoiceDescriptionChild(
    List<QuestionChoicesEntity> questionList,
    String question,
    String? choice,
  ) {
    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "";
    }

    final choiceEntitys =
        questionEntity.choices?.where((t) => t.choices != null).toList();
    if (choiceEntitys == null) {
      return "";
    }

    ChoiceEntity? choiceChildEntity;
    for (int i = 0; i < choiceEntitys.length; i++) {
      final choiceEntity = choiceEntitys[0];
      choiceChildEntity =
          choiceEntity.choices?.where((t) => t.choice == choice).firstOrNull;
      if (choiceChildEntity != null) {
        break;
      }
    }

    if (choiceChildEntity == null) {
      return "";
    }

    return convertToString(choiceChildEntity.desc);
  }
}
