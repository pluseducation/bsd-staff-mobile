import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screenings-api.dart';
import 'package:bst_staff_mobile/data/network/entity/master-entity.dart';
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

      final String dateOfBirthText =
          formatThaiDateOfBirth(entityPatient.dateOfBirth);

      final String nationalityText = convertToString(
        entityNationallity
            .where((t) => t.id == entityPatient.nationalityId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      final String religionText = convertToString(
        entityReligion
            .where((t) => t.id == entityPatient.religionId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      // -----หมู่บ้าน/ชุมชน
      final String villages = convertToString(
        entityVillages
            .where((t) => t.id == entityPatient.registeredVillageId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      // ----จังหวัด

      final String province = convertToString(
        entityProvinces
            .where((t) => t.id == entityPatient.registeredProvinceId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      // ----เขต

      final String districts = convertToString(
        entityDistricts
            .where((t) => t.id == entityPatient.registeredDistrictId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      // ตำบล
      final String subdistricts = convertToString(
        entitySubdistricts
            .where((t) => t.id == entityPatient.registeredSubDistrictId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      final String registereText =
          "${entityPatient.registeredHouseNo} ${entityPatient.registeredHouseMoo} $villages ${entityPatient.registeredHouseRoad} $province $districts $subdistricts ${entityPatient.registeredPostalCode}";

      // -----หมู่บ้าน/ชุมชน
      final String currentVillageText = convertToString(
        entityVillages
            .where((t) => t.id == entityPatient.currentVillageId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      final String currentProvinceText = convertToString(
        entityProvinces
            .where((t) => t.id == entityPatient.currentProvinceId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      final String currentDistrictText = convertToString(
        entityDistricts
            .where((t) => t.id == entityPatient.currentDistrictId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

      // ตำบล
      final String currentSubDistrictText = convertToString(
        entitySubdistricts
            .where((t) => t.id == entityPatient.currentSubDistrictId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
      );

// ${entityPatient.currentAddrAsRegistered}
      final String currentAddrText =
          "${entityPatient.currentHouseNo} ${entityPatient.currentHouseMoo} ${entityPatient.currentHouseMoo} $currentVillageText ${entityPatient.currentHouseRoad} $currentProvinceText $currentDistrictText  $currentSubDistrictText ${entityPatient.currentPostalCode}";

      final String guardianfullNameText =
          "${entityPatient.guardianName} ${entityPatient.guardianSurname}";

      final String relationShipText = convertToString(
        entityRelationShip
            .where((t) => t.id == entityPatient.relationShipId)
            .map((t) => t.name)
            .firstWhere(
              (name) => name != null,
              orElse: () => "",
            ),
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
    final entityScreenings =
        await screeningsApi.findScreenings(id, patientsid: id);

    final entityMaritalstatuses = await masterApi.findMaritalstatuses();
    final entityEducations = await masterApi.findEducations();
    final entityOccupations = await masterApi.findOccupations();
    final entityIncomes = await masterApi.findIncomes();
    final entityRelationshipsvalue = await masterApi.findRelationshipsvalue();
    final entityDrugs = await masterApi.findDrugs();
    final entityMentaltreatments = await masterApi.findMentaltreatments();
    final entityCriminalcases = await masterApi.findcriminalcases();
    final entityChroniccontagiouses = await masterApi.findChroniccontagiouses();

    final entityQuestion = await questionApi.findScreeningsQuestionChoices();

    // final String startDate = convertToString(entityScreenings.startDate);

    final String maritalstatusesText = convertToString(
      entityMaritalstatuses
          .where((t) => t.id == entityScreenings.maritalStatusId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String educationsText = convertToString(
      entityEducations
          .where((t) => t.id == entityScreenings.educationId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String occupationsText = convertToString(
      entityOccupations
          .where((t) => t.id == entityScreenings.occupationId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String incomesText = convertToString(
      entityIncomes
          .where((t) => t.id == entityScreenings.incomeId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String livingWithLast30days = _getChoiceDescriptionList(
      entityQuestion,
      "screening_info_last_30_days_answer",
      entityScreenings.livingWithLast30days ?? [],
    );

    final String relationshipsvalueText = convertToString(
      entityRelationshipsvalue
          .where((t) => t.id == entityScreenings.parentRelationshipId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String startDate = entityScreenings.startDate != null
        ? formatThaiDate(entityScreenings.startDate)
        : '';

    final String isToBeNumberOneMember = _getChoiceDescription(
      entityQuestion,
      "is_to_be_number_one_member",
      entityScreenings.isToBeNumberOneMember,
    );

    final String drugUsageApproach = _getChoiceDescription(
      entityQuestion,
      "drug_usage_approach",
      entityScreenings.drugUsageApproach ?? "",
    );

    String mainDrugsText = _getDrugDescriptionList(
      entityDrugs,
      entityScreenings.mainDrugs ?? [],
    );

    final String mentalEvalLevel =
        convertToString(entityScreenings.mentalEvalLevel);

    final String frequencyOfUse = _getChoiceDescription(
      entityQuestion,
      "frequency_of_use",
      entityScreenings.frequencyOfUse,
    );

    final String feelingAddicted = _getChoiceDescription(
      entityQuestion,
      "feeling_addicted",
      entityScreenings.feelingAddicted,
    );

    // irresponsible

    final String irresponsible = _getChoiceDescription(
      entityQuestion,
      "irresponsible",
      entityScreenings.irresponsible,
    );

    final String frequencyOfProblem = _getChoiceDescription(
      entityQuestion,
      "frequency_of_problem",
      entityScreenings.frequencyOfProblem,
    );

    // beNoticed
    final String beNoticed = _getChoiceDescription(
      entityQuestion,
      "be_noticed",
      entityScreenings.beNoticed,
    );

    final String stopUsingButNotSuccess = _getChoiceDescription(
      entityQuestion,
      "stop_using_but_not_success",
      entityScreenings.stopUsingButNotSuccess,
    );

    final String DrugsText = _getChoiceDescriptionList(
      entityQuestion,
      "screening_info_last_30_days_answer",
      entityScreenings.livingWithLast30days ?? [],
    );
    //  ผลการคัดกรอง

    final String levelOfAddicted =
        convertToString(entityScreenings.levelOfAddicted);

    final int mentalEvalScore = convertToInt(entityScreenings.mentalEvalScore);

    final String screeningResult =
        convertToString(entityScreenings.screeningResult);

    final String injectableDrug = _getChoiceDescription(
      entityQuestion,
      "injectable_drug",
      entityScreenings.injectableDrug,
    );

    final String last3monthUsage = _getChoiceDescription(
      entityQuestion,
      "last_3_months_usage",
      entityScreenings.last3MonthUsage,
    );

    final String hadMentalTreatment = _getChoiceDescription(
      entityQuestion,
      "had_mental_treatment",
      entityScreenings.hadMentalTreatment,
    );

    final String? mentalTreatmentText = convertToString(
      entityMentaltreatments
          .where((t) => t.id == entityScreenings.mentalTreatmentId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String hadCriminalCase = _getChoiceDescription(
      entityQuestion,
      "had_criminal_case",
      entityScreenings.hadCriminalCase,
    );

    final String homeless = _getChoiceDescription(
      entityQuestion,
      "is_homeless",
      entityScreenings.homeless,
    );

    final String disabledPerson = _getChoiceDescription(
      entityQuestion,
      "disabled_person",
      entityScreenings.disabledPerson,
    );

    final String criminalCaseText = convertToString(
      entityCriminalcases
          .where((t) => t.id == entityScreenings.criminalCaseId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    final String chronicContagiousText = convertToString(
      entityChroniccontagiouses
          .where((t) => t.id == entityScreenings.chronicContagiousId)
          .map((t) => t.name)
          .firstWhere(
            (name) => name != null,
            orElse: () => "",
          ),
    );

    print('finish');
  }

  String _getDrugDescriptionList(
    List<DrugsEntity> drugList,
    List<AnswerEntity> answers,
  ) {
    final List<String> values = [];

    for (final answer in answers) {
      if (answer.answer == "17") {
        values.add(convertToString(answer.other));
      } else {
        final drugEntity =
            drugList.where((t) => t.id.toString() == answer.answer).firstOrNull;

        if (drugEntity != null) {
          values.add(convertToString(drugEntity.name));
        }
      }
    }

    if (values.isEmpty) {
      return "";
    }

    return values.join(', ');
  }

  String _getChoiceDescriptionList(List<QuestionChoicesEntity> questionList,
      String question, List<AnswerEntity> answers) {
    final List<String> values = [];

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
      if (answer.answer == "OTHER") {
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
