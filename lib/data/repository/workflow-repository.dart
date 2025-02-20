import 'package:bst_staff_mobile/data/network/api/monitoring-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screening-api.dart';
import 'package:bst_staff_mobile/data/network/api/treatment-api.dart';
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
          await questionApi.findScreeningQuestionChoices();
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
        "screening_info_last_30_days_answer",
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
      final questionEntity = await questionApi.findScreeningQuestionChoices();

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
        screeningDate: screeningEntity.screeningDate,
        levelType: LevelType.setValue(screeningEntity.level),
        drugEvalResult: DrugEvalResult.setValue(screeningEntity.drugEvalResult),
        isToBeNumberOneMember: isToBeNumberOneMember,
        toBeNumberOneDate: convertToString(
          screeningEntity.toBeNumberOneDate,
          defaultValue: "-",
        ),
        drugUsageApproach: drugUsageApproach,
        injectableDrug: injectableDrug,
        mainDrug: convertToString(screeningEntity.mainDrug, defaultValue: "-"),
        secondaryDrug:
            convertToString(screeningEntity.secondaryDrug, defaultValue: "-"),
        hadMentalTreatment: hadMentalTreatment,
        mentalTreatment: mentalTreatment,
        hadChronicContagious: hadChronicContagious,
        chronicContagious: chronicContagious,
        hadCriminalCase: hadCriminalCase,
        criminalCase: criminalCase,
        homeless: homeless,
        disabledPerson: disabledPerson,
        disabledCertificateNo: convertToString(
            screeningEntity.disabledCertificateNo,
            defaultValue: "-"),
      );

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<Treatment> findTreatment(int patientId) async {
    try {
      final treatmentEntity = await treatmentApi.findTreatment(patientId);
      final questionEntity = await questionApi.findTreatmentQuestionChoices();

      final usageReasons = findChoiceDescriptionList(
          questionEntity, "first_usage_reasons", treatmentEntity.usageReasons);
      final currentDrugUsages = treatmentEntity.currentDrugUsages != null
          ? treatmentEntity.currentDrugUsages!.join(", ")
          : "";
      final hadTreatmentText = findChoiceDescription(
        questionEntity,
        "had_treatment",
        treatmentEntity.hadTreatment,
      );
      final inHistories = findTreatmentHistory(treatmentEntity.inHistories);
      final outHistories = findTreatmentHistory(treatmentEntity.outHistories);
      final joinReasons = findChoiceDescriptionList(
        questionEntity,
        "treatment_join_reason",
        treatmentEntity.joinReasons,
      );

      final drugUsageBefores =
          findDrugUsageBefore(treatmentEntity.drugUsageBefores);

      final plans = findPlan(treatmentEntity.plans);

      final dosings = treatmentEntity.dosings ?? List<String>.empty();

      final techniques = findChoiceDescriptionList(
        questionEntity,
        "technique",
        treatmentEntity.techniques,
      );

      final programmes = findChoiceDescriptionList(
        questionEntity,
        "treatment_programme",
        treatmentEntity.programmes,
      );

      final harmItems = treatmentEntity.harmItems != null
          ? treatmentEntity.harmItems!
          : List<String>.empty();

      final completedReasonText = findChoiceDescription(
        questionEntity,
        "completed_reason",
        treatmentEntity.completedReason,
      );

      final inCompletedReasonText = findChoiceDescription(
        questionEntity,
        "incompleted_reason",
        treatmentEntity.incompletedReason,
      );

      final mentalTreatmentResultText = findChoiceDescription(
        questionEntity,
        "mental_treatment_result",
        treatmentEntity.mentalTreatmentResult,
      );

      final physicalTreatmentResultText = findChoiceDescription(
        questionEntity,
        "phisical_treatment_result",
        treatmentEntity.physicalTreatmentResult,
      );

      final model = Treatment(
        treatmentDate: treatmentEntity.treatmentDate,
        mentalEvalLevel: LevelType.setValue(treatmentEntity.mentalEvalLevel),
        treatmentResult:
            DrugEvalResult.setValue(treatmentEntity.treatmentResult),
        usageReasons: usageReasons.isNotEmpty ? usageReasons.join(", ") : "-",
        firstAgeUsage:
            convertToString(treatmentEntity.firstAgeUsage, defaultValue: "-"),
        firstDrugUsage:
            convertToString(treatmentEntity.firstDrugUsage, defaultValue: "-"),
        currentDrugUsages: currentDrugUsages,
        totalUsage:
            convertToString(treatmentEntity.totalUsage, defaultValue: "-"),
        hadTreatmentText: hadTreatmentText,
        inHistories: inHistories,
        outHistoryies: outHistories,
        joinReasons: joinReasons,
        drugUsageBefores: drugUsageBefores,
        plans: plans,
        dosings: dosings,
        techniques: techniques,
        programmes: programmes,
        harmReduction: convertToBool(treatmentEntity.harmReduction),
        harmItems: harmItems,
        evaluationDate:
            convertToString(treatmentEntity.evaluationDate, defaultValue: "-"),
        evaluationResult:
            TreatmentStatus.setValue(treatmentEntity.evaluationResult),
        completedReasonText: completedReasonText,
        mentalTreatmentResultText: mentalTreatmentResultText,
        physicalTreatmentResultText: physicalTreatmentResultText,
        incompletedReasonText: inCompletedReasonText,
      );

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Monitoring>> findMonitoring(int patientId) async {
    try {
      final monitoringEntitys = await monitoringApi.findMonitoring(patientId);

      String latestResultDateText = "";
      if (monitoringEntitys.isNotEmpty) {
        final latestResultDate = monitoringEntitys
            .where((t) => t.finalRound == 1)
            .firstOrNull
            ?.endDate;
        latestResultDateText = formatDate(latestResultDate, defaultValue: "-");
      }

      final models = monitoringEntitys.map((monitoringEntity) {
        return Monitoring(
          latestResultDate: latestResultDateText,
          startDate: formatDate(monitoringEntity.startDate),
          endDate: convertToString(monitoringEntity.endDate, defaultValue: "-"),
          round: convertToInt(monitoringEntity.round),
          subdivision:
              convertToString(monitoringEntity.subdivision, defaultValue: "-"),
          latestResult: UsingDrugStatus.setValue(monitoringEntity.latestResult),
          finalRound: monitoringEntity.finalRound == 1,
        );
      }).toList();

      return models;
    } catch (e) {
      rethrow;
    }
  }

  List<TreatmentHistory> findTreatmentHistory(
    List<TreatmentHistoryEntity>? treatmentHistoryEntitys,
  ) {
    if (treatmentHistoryEntitys == null) {
      return List.empty();
    }

    final values = treatmentHistoryEntitys.map((item) {
      return TreatmentHistory(
        subDivisionName:
            convertToString(item.subDivisionName, defaultValue: "-"),
        times: convertToInt(item.times),
        lastestUsedDate: convertToString(
          item.lastestUsedDate,
          defaultValue: "-",
        ),
      );
    }).toList();

    return values;
  }

  List<DrugUsageBefore> findDrugUsageBefore(
    List<DrugUsageBeforeEntity>? drugUsageBeforeEntity,
  ) {
    if (drugUsageBeforeEntity == null) {
      return List.empty();
    }

    final values = drugUsageBeforeEntity.map((item) {
      return DrugUsageBefore(
        order: convertToInt(item.order),
        drug: convertToString(
          item.drug,
          defaultValue: "-",
        ),
        firstYearUsage: convertToString(
          item.firstYearUsage,
          defaultValue: "-",
        ),
      );
    }).toList();

    return values;
  }

  List<Plan> findPlan(
    List<PlanEntity>? planEntitys,
  ) {
    if (planEntitys == null) {
      return List.empty();
    }

    final values = planEntitys.map((item) {
      final startDate = item.planEvalResults?.first.evalDate;
      final startDateText = startDate ?? "-";

      final lastedEvalResult = item.planEvalResults?.last.evalResult;

      final round = item.planEvalResults?.length;
      final roundText = round != null ? round.toString() : "-";

      return Plan(
        planType: convertToString(item.planType, defaultValue: "-"),
        subDivisionName: convertToString(item.subDivision, defaultValue: "-"),
        startDate: startDateText,
        endDate: convertToString(item.endDate, defaultValue: "-"),
        round: roundText,
        lastedEvalResult: LastedEvalResult.setValue(lastedEvalResult),
      );
    }).toList();

    return values;
  }

  List<String> findChoiceDescriptionList(
    List<QuestionChoicesEntity> questionList,
    String question,
    List<AnswerEntity>? answers,
  ) {
    if (answers == null) {
      return List.empty();
    }

    final List<String> values = [];

    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return List.empty();
    }

    final choiseEntitys = questionEntity.choices;
    if (choiseEntitys == null) {
      return List.empty();
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
      return List.empty();
    }

    return values;
  }

  List<String> findChoiceDescriptionListForDosing(
    List<QuestionChoicesEntity> questionList,
    String question,
    List<AnswerEntity>? answers,
  ) {
    if (answers == null) {
      return List.empty();
    }

    final List<String> values = [];

    final questionEntity =
        questionList.where((t) => t.question?.question == question).firstOrNull;
    if (questionEntity == null) {
      return List.empty();
    }

    // dosing where choice == "YES"
    final choiseEntitys = questionEntity.choices
        ?.where((t) => t.choice == "YES")
        .firstOrNull
        ?.choices;
    if (choiseEntitys == null) {
      return List.empty();
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
      return List.empty();
    }

    return values;
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

    return convertToString(choise.desc, defaultValue: "-");
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

    return convertToString(choiceChildEntity.desc, defaultValue: "-");
  }
}
