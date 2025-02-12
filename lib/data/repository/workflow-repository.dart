import 'package:bst_staff_mobile/data/network/api/monitoring-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screening-api.dart';
import 'package:bst_staff_mobile/data/network/api/treatment-api.dart';
import 'package:bst_staff_mobile/data/network/entity/master-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class WorkflowRepository {
  final PatientApi patientApi;
  final ScreeningApi screeningApi;
  final TreatmentApi treatmentApi;
  final MonitoringApi monitoringApi;
  final Question questionApi;
  final NetworkMapper networkMapper;

  WorkflowRepository({
    required this.patientApi,
    required this.screeningApi,
    required this.treatmentApi,
    required this.monitoringApi,
    required this.questionApi,
    required this.networkMapper,
  });

  Future<Registering> findRegistering(int patientId) async {
    try {
      final patientEntity = await patientApi.findPatient(patientId);

      final questionEntity = await questionApi.findRegisteringQuestionChoices();
      final questionScreeningEntity =
          await questionApi.findScreeningsQuestionChoices();
      String imagePath = "";

      if (patientEntity.gender == "ชาย") {
        imagePath = Constant.maleImage;
      } else if (patientEntity.gender == "หญิง") {
        imagePath = Constant.femaleImage;
      } else {
        imagePath = Constant.femaleImage;
      }

      final fullName =
          "${convertToString(patientEntity.name)} ${convertToString(patientEntity.surname)}";
      final genderText = convertToString(patientEntity.gender);
      //findChoiceDescription(questionEntity, "gender", patientEntity.gender);

      String registereAddress = "-";
      final List<String?> addressComponents = [
        patientEntity.registeredHouseNo,
        patientEntity.registeredHouseMoo,
        patientEntity.registeredHouseRoad,
        patientEntity.registeredVillage,
        patientEntity.registeredSubDistrict,
        patientEntity.registeredDistrict,
        patientEntity.registeredProvince,
        patientEntity.registeredPostalCode,
      ];

      final registereAddressList = addressComponents
          .where((component) => component != null && component != "")
          .map((component) => convertToString(component))
          .toList();

      if (registereAddressList.isNotEmpty) {
        registereAddress = registereAddressList.join(" ");
      }

      String currentAddress = "-";
      final List<String?> currentAddressComponents = [
        patientEntity.currentHouseNo,
        patientEntity.currentHouseMoo,
        patientEntity.currentHouseRoad,
        patientEntity.currentVillage,
        patientEntity.currentSubDistrict,
        patientEntity.currentDistrict,
        patientEntity.currentProvince,
        patientEntity.currentPostalCode,
      ];

      final currentAddressList = currentAddressComponents
          .where((component) => component != null && component != "")
          .map((component) => convertToString(component))
          .toList();

      if (currentAddressList.isNotEmpty) {
        currentAddress = currentAddressList.join(" ");
      }

      String guardianfullName = "-";
      if (patientEntity.guardianName != null &&
          patientEntity.guardianSurname != null) {
        guardianfullName =
            "${convertToString(patientEntity.guardianName)} ${convertToString(patientEntity.guardianSurname)}";
      }

      final livingWithText = findChoiceDescription(
        questionScreeningEntity,
        "living_with",
        patientEntity.livingWith,
      );

      final joinTreatmentByText = findChoiceDescription(
        questionEntity,
        "join_treatment_by",
        patientEntity.joinTreatmentBy,
      );

      final joinSentByCourtText = findChoiceDescriptionChild(
        questionEntity,
        "join_treatment_by",
        patientEntity.joinSentByCourt,
      );

      final model = Registering(
        imagePath: imagePath,
        fullname: fullName,
        nationalId:
            convertToString(patientEntity.nationalId, defaultValue: "-"),
        phoneNo: convertToString(patientEntity.phoneNo),
        dateOfBirth:
            convertToString(patientEntity.dateOfBirth, defaultValue: "-"),
        age: convertToString(patientEntity.age, defaultValue: "-"),
        genderText: genderText,
        nationality:
            convertToString(patientEntity.nationality, defaultValue: "-"),
        religion: convertToString(patientEntity.religion, defaultValue: "-"),
        registereAddress: registereAddress,
        currentAddress: currentAddress,
        maritalStatus:
            convertToString(patientEntity.maritalStatus, defaultValue: "-"),
        education: convertToString(patientEntity.education, defaultValue: "-"),
        occupation:
            convertToString(patientEntity.occupation, defaultValue: "-"),
        income: convertToString(patientEntity.income, defaultValue: "-"),
        guardianfullName: guardianfullName,
        guardianPhoneNo: convertToString(patientEntity.guardianPhoneNo),
        livingWithText: livingWithText,
        joinTreatmentByText: joinTreatmentByText,
        joinSentByCourtText: joinSentByCourtText,
      );

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<Screening> findScreening(int patientId) async {
    try {
      final screeningEntity = await screeningApi.findScreening(patientId);
      final questionEntity = await questionApi.findScreeningsQuestionChoices();

      final isToBeNumberOneMember = findChoiceDescription(
        questionEntity,
        "is_to_be_number_one_member",
        screeningEntity.isToBeNumberOneMember,
      );

      final injectableDrug = findChoiceDescription(
        questionEntity,
        "injectable_drug",
        screeningEntity.injectableDrug,
      );

      final homeless = findChoiceDescription(
        questionEntity,
        "is_homeless",
        screeningEntity.homeless,
      );

      final disabledPerson = findChoiceDescription(
        questionEntity,
        "disabled_person",
        screeningEntity.disabledPerson,
      );

      final hadMentalTreatment = findChoiceDescription(
        questionEntity,
        "had_mental_treatment",
        screeningEntity.hadMentalTreatment,
      );

      final hadChronicContagious = findChoiceDescription(
        questionEntity,
        "had_chronic_contagious",
        screeningEntity.hadChronicContagious,
      );

      final hadCriminalCase = findChoiceDescription(
        questionEntity,
        "had_criminal_case",
        screeningEntity.hadCriminalCase,
      );

      final mentalTreatment = screeningEntity.mentalTreatment != null
          ? convertToString(screeningEntity.mentalTreatment)
          : convertToString(screeningEntity.mentalTreatmentOther);

      final chronicContagious = screeningEntity.chronicContagious != null
          ? convertToString(screeningEntity.chronicContagious)
          : convertToString(screeningEntity.chronicContagiousOther);

      final criminalCase = screeningEntity.criminalCase != null
          ? convertToString(screeningEntity.criminalCase)
          : convertToString(screeningEntity.criminalCaseOther);

      final drugUsageApproach = findChoiceDescription(
        questionEntity,
        "drug_usage_approach",
        screeningEntity.drugUsageApproach,
      );

      final model = Screening(
        screeningDate: convertToString(screeningEntity.screeningDate),
        levelType: LevelType.setValue(screeningEntity.level),
        drugEvalResult: DrugEvalResult.setValue(screeningEntity.drugEvalResult),
        isToBeNumberOneMember: isToBeNumberOneMember,
        toBeNumberOneDate: convertToString(screeningEntity.toBeNumberOneDate),
        drugUsageApproach: drugUsageApproach,
        injectableDrug: injectableDrug,
        mainDrug: convertToString(screeningEntity.mainDrug),
        secondaryDrug: convertToString(screeningEntity.secondaryDrug),
        hadMentalTreatment: hadMentalTreatment,
        mentalTreatment: mentalTreatment,
        hadChronicContagious: hadChronicContagious,
        chronicContagious: chronicContagious,
        hadCriminalCase: hadCriminalCase,
        criminalCase: criminalCase,
        homeless: homeless,
        disabledPerson: disabledPerson,
        disabledCertificateNo:
            convertToString(screeningEntity.disabledCertificateNo),
      );

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Monitoring>> findMonitoring(int patientId) async {
    try {
      final monitoringEntitys = await monitoringApi.findMonitoring(patientId);
      //final questionEntity = await questionApi.findScreeningsQuestionChoices();

      final models = monitoringEntitys.map((monitoringEntity) {
        return Monitoring(
          startDate: formatDate(monitoringEntity.startDate),
          endDate: convertToString(monitoringEntity.endDate),
          round: convertToInt(monitoringEntity.round),
          subdivision: convertToString(monitoringEntity.subdivision),
          latestResult: convertToString(monitoringEntity.latestResult),
          finalRound: monitoringEntity.finalRound == 1,
        );
      }).toList();

      return models;
    } catch (e) {
      rethrow;
    }
  }

  String _findDrugDescription(
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

  String _findChoiceDescriptionList(
    List<QuestionChoicesEntity> questionList,
    String question,
    List<AnswerEntity> answers,
  ) {
    final List<String> values = [];

    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "-";
    }

    final choiseEntitys = questionEntity.choices;
    if (choiseEntitys == null) {
      return "-";
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
      return "-";
    }

    return values.join(', ');
  }

  String findChoiceDescription(
    List<QuestionChoicesEntity> questionList,
    String question,
    String? choice,
  ) {
    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "-";
    }

    final choise =
        questionEntity.choices?.where((t) => t.choice == choice).firstOrNull;
    if (choise == null) {
      return "-";
    }

    return convertToString(choise.desc);
  }

  String findChoiceDescriptionChild(
    List<QuestionChoicesEntity> questionList,
    String question,
    String? choice,
  ) {
    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return "-";
    }

    final choiceEntitys =
        questionEntity.choices?.where((t) => t.choices != null).toList();
    if (choiceEntitys == null) {
      return "-";
    }

    ChoiceEntity? choiceChildEntity;
    for (int i = 0; i < choiceEntitys.length; i++) {
      final choiceEntity = choiceEntitys[i];
      choiceChildEntity =
          choiceEntity.choices?.where((t) => t.choice == choice).firstOrNull;
      if (choiceChildEntity != null) {
        break;
      }
    }

    if (choiceChildEntity == null) {
      return "-";
    }

    return convertToString(choiceChildEntity.desc);
  }
}
