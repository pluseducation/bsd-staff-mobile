import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/api/screening-api.dart';
import 'package:bst_staff_mobile/data/network/api/treatment-api.dart';
import 'package:bst_staff_mobile/data/network/entity/master-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class WorkflowRepository {
  final PatientApi patientApi;
  final ScreeningApi screeningApi;
  final TreatmentApi treatmentApi;
  final Question questionApi;
  final NetworkMapper networkMapper;

  WorkflowRepository({
    required this.patientApi,
    required this.screeningApi,
    required this.treatmentApi,
    required this.questionApi,
    required this.networkMapper,
  });

  // Future<Registering> findRegistering(int id) async {
  //   try {
  //     final entityPatient =
  //         await patientApi.findPatient(id, patientsid: id); // print

  //     final entityProfile =
  //         await patientApi.findProfile(id, patientsid: id); //ใช่

  //     final entityQuestion = await questionApi.findRegisteringQuestionChoices();
  //     String imagePath = "";
  //     if (entityPatient.gender == "MALE") {
  //       imagePath = "assets/images/male.png";
  //     } else if (entityPatient.gender == "FEMALE") {
  //       imagePath = "assets/images/female.png";
  //     } else {
  //       imagePath = "assets/images/female.png";
  //     }

  //     final String fullname =
  //         "${convertToString(entityPatient.name)} ${convertToString(entityPatient.surname)}";
  //     final String patientStatus = convertToString(entityProfile.patientStatus);
  //     final String level = convertToString(entityProfile.level);

  //     final String dateOfBirthText =
  //         formatThaiDateOfBirth(parseDate(entityPatient.dateOfBirth));

  //     final String nationalityText = convertToString(entityPatient.nationality);

  //     final String religionText = convertToString(entityPatient.religion);

  //     // -----หมู่บ้าน/ชุมชน
  //     final String villages = convertToString(entityPatient.registeredVillage);

  //     // ----จังหวัด

  //     final String province = convertToString(entityPatient.registeredProvince);

  //     // ----เขต

  //     final String districts =
  //         convertToString(entityPatient.registeredDistrict);

  //     // ตำบล
  //     final String subdistricts =
  //         convertToString(entityPatient.registeredSubDistrict);

  //     String registereText = "";

  //     if (entityPatient.registeredHouseNo != null) {
  //       registereText += "${entityPatient.registeredHouseNo} ";
  //     }
  //     if (entityPatient.registeredHouseMoo != null) {
  //       registereText += "${entityPatient.registeredHouseMoo} ";
  //     }
  //     if (villages.isNotEmpty) {
  //       registereText += "$villages ";
  //     }
  //     if (entityPatient.registeredHouseRoad != null) {
  //       registereText += "${entityPatient.registeredHouseRoad} ";
  //     }
  //     if (province.isNotEmpty) {
  //       registereText += "$province ";
  //     }
  //     if (districts.isNotEmpty) {
  //       registereText += "$districts ";
  //     }
  //     if (subdistricts.isNotEmpty) {
  //       registereText += "$subdistricts ";
  //     }
  //     // if (entityPatient.registeredPostalCode != null) {
  //     //   registereText += "${entityPatient.registeredPostalCode}"; //ไม่มี field
  //     // }

  //     // -----หมู่บ้าน/ชุมชน
  //     final String currentVillageText =
  //         convertToString(entityPatient.currentVillage);

  //     final String currentProvinceText =
  //         convertToString(entityPatient.currentProvince);

  //     final String currentDistrictText =
  //         convertToString(entityPatient.currentDistrict);

  //     // ตำบล
  //     final String currentSubDistrictText =
  //         convertToString(entityPatient.currentSubDistrict);

  //     String currentAddrText = "";
  //     if (entityPatient.currentHouseNo != null) {
  //       currentAddrText += "${entityPatient.currentHouseNo} ";
  //     }
  //     if (entityPatient.currentHouseMoo != null) {
  //       currentAddrText += "${entityPatient.currentHouseMoo} ";
  //     }
  //     if (currentVillageText.isNotEmpty) {
  //       currentAddrText += "$currentVillageText ";
  //     }
  //     if (entityPatient.currentHouseRoad != null) {
  //       currentAddrText += "${entityPatient.currentHouseRoad} ";
  //     }
  //     if (currentProvinceText.isNotEmpty) {
  //       currentAddrText += "$currentProvinceText ";
  //     }
  //     if (currentDistrictText.isNotEmpty) {
  //       currentAddrText += "$currentDistrictText ";
  //     }
  //     if (currentSubDistrictText.isNotEmpty) {
  //       currentAddrText += "$currentSubDistrictText ";
  //     }
  //     // if (entityPatient.currentPostalCode != null) {
  //     //   currentAddrText += "${entityPatient.currentPostalCode}";
  //     // }

  //     String guardianfullNameText = "";
  //     final String tmpGuardianName =
  //         convertToString(entityPatient.guardianName);
  //     final String tmpGuardianSurName =
  //         convertToString(entityPatient.guardianSurname);

  //     if (tmpGuardianName.isNotEmpty && tmpGuardianName.isNotEmpty) {
  //       guardianfullNameText = "$tmpGuardianName $tmpGuardianSurName";
  //     }

  //     final String relationShipText =
  //         convertToString(entityPatient.guardianRelationShip);

  //     final String guardianPhoneNo = "${entityPatient.guardianPhoneNo}";

  //     final String gender = _getChoiceDescription(
  //       entityQuestion,
  //       "gender",
  //       entityPatient.gender,
  //     );

  //     String? joinTreatmentByText = "";
  //     joinTreatmentByText = _getChoiceDescription(
  //       entityQuestion,
  //       "join_treatment_by_prison",
  //       entityPatient.joinTreatmentBy,
  //     );

  //     if (joinTreatmentByText.isEmpty) {
  //       joinTreatmentByText = _getChoiceDescription(
  //         entityQuestion,
  //         "join_treatment_by_djop",
  //         entityPatient.joinTreatmentBy,
  //       );
  //     }

  //     if (joinTreatmentByText.isEmpty) {
  //       joinTreatmentByText = _getChoiceDescription(
  //         entityQuestion,
  //         "join_treatment_by",
  //         entityPatient.joinTreatmentBy,
  //       );
  //     }
  //     // --------------------------

  //     String? joinSentByCourtText = "";
  //     joinSentByCourtText = _getChoiceDescriptionChild(
  //       entityQuestion,
  //       "join_treatment_by_prison",
  //       entityPatient.joinSentByCourt,
  //     );

  //     if (joinSentByCourtText.isEmpty) {
  //       joinSentByCourtText = _getChoiceDescriptionChild(
  //         entityQuestion,
  //         "join_treatment_by_djop",
  //         entityPatient.joinSentByCourt,
  //       );
  //     }

  //     if (joinSentByCourtText.isEmpty) {
  //       joinSentByCourtText = _getChoiceDescriptionChild(
  //         entityQuestion,
  //         "join_treatment_by",
  //         entityPatient.joinSentByCourt,
  //       );
  //     }

  //     final model = Registering(
  //       imagePath: imagePath,
  //       fullname: fullname,
  //       patientStatus: patientStatus,
  //       level: level,
  //       dateOfBirthText: dateOfBirthText,
  //       gender: gender,
  //       nationalityText: nationalityText, //
  //       religionText: religionText,
  //       registereText: registereText,
  //       currentAddrText: currentAddrText,
  //       guardianfullNameText: guardianfullNameText,
  //       relationShipText: relationShipText,
  //       guardianPhoneNo: guardianPhoneNo,
  //       joinTreatmentByText: joinTreatmentByText,
  //       joinSentByCourtText: joinSentByCourtText,
  //     );

  //     return model;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<Screening> findScreening(int id) async {
  //   final entityScreenings =
  //       await screeningApi.findScreenings(id, patientsid: id);

  //   final entityQuestion = await questionApi.findScreeningsQuestionChoices();

  //   final String maritalStatusText = convertToString(
  //     entityMaritalstatuses
  //         .where((t) => t.id == entityScreenings.maritalStatusId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String educationText = convertToString(
  //     entityEducations
  //         .where((t) => t.id == entityScreenings.educationId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String occupationText = convertToString(
  //     entityOccupations
  //         .where((t) => t.id == entityScreenings.occupationId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String incomeText = convertToString(
  //     entityIncomes
  //         .where((t) => t.id == entityScreenings.incomeId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String livingWithLast30days = _getChoiceDescriptionList(
  //     entityQuestion,
  //     "screening_info_last_30_days_answer",
  //     entityScreenings.livingWithLast30days ?? [],
  //   );

  //   final String parentRelationshipText = convertToString(
  //     entityRelationshipsvalue
  //         .where((t) => t.id == entityScreenings.parentRelationshipId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String screeningDate = entityScreenings.screeningDate != null
  //       ? convertThaiDate(entityScreenings.screeningDate)
  //       : '';

  //   final String isToBeNumberOneMember = _getChoiceDescription(
  //     entityQuestion,
  //     "is_to_be_number_one_member",
  //     entityScreenings.isToBeNumberOneMember,
  //   );

  //   final String drugUsageApproach = _getChoiceDescription(
  //     entityQuestion,
  //     "drug_usage_approach",
  //     entityScreenings.drugUsageApproach ?? "",
  //   );

  //   final mainDrugsTexts = _getDrugDescriptionList(
  //     entityDrugs,
  //     entityScreenings.mainDrugs ?? [],
  //   );

  //   final String mentalEvalLevel =
  //       convertToString(entityScreenings.mentalEvalLevel);

  //   final String frequencyOfUse = _getChoiceDescription(
  //     entityQuestion,
  //     "frequency_of_use",
  //     entityScreenings.frequencyOfUse,
  //   );

  //   final String feelingAddicted = _getChoiceDescription(
  //     entityQuestion,
  //     "feeling_addicted",
  //     entityScreenings.feelingAddicted,
  //   );

  //   // irresponsible

  //   final String irresponsible = _getChoiceDescription(
  //     entityQuestion,
  //     "irresponsible",
  //     entityScreenings.irresponsible,
  //   );

  //   final String frequencyOfProblem = _getChoiceDescription(
  //     entityQuestion,
  //     "frequency_of_problem",
  //     entityScreenings.frequencyOfProblem,
  //   );

  //   // beNoticed
  //   final String beNoticed = _getChoiceDescription(
  //     entityQuestion,
  //     "be_noticed",
  //     entityScreenings.beNoticed,
  //   );

  //   final String stopUsingButNotSuccess = _getChoiceDescription(
  //     entityQuestion,
  //     "stop_using_but_not_success",
  //     entityScreenings.stopUsingButNotSuccess,
  //   );

  //   //  ผลการคัดกรอง

  //   final String levelOfAddicted =
  //       convertToString(entityScreenings.levelOfAddicted);

  //   final int drugEvalScore = convertToInt(entityScreenings.drugEvalScore);

  //   final String screeningResult =
  //       convertToString(entityScreenings.screeningResult);

  //   final String injectableDrug = _getChoiceDescription(
  //     entityQuestion,
  //     "injectable_drug",
  //     entityScreenings.injectableDrug,
  //   );

  //   final String last3monthUsage = _getChoiceDescription(
  //     entityQuestion,
  //     "last_3_months_usage",
  //     entityScreenings.last3MonthUsage,
  //   );

  //   final String hadMentalTreatment = _getChoiceDescription(
  //     entityQuestion,
  //     "had_mental_treatment",
  //     entityScreenings.hadMentalTreatment,
  //   );

  //   final mentalTreatmentText = convertToString(
  //     entityMentaltreatments
  //         .where((t) => t.id == entityScreenings.mentalTreatmentId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final hadCriminalCase = _getChoiceDescription(
  //     entityQuestion,
  //     "had_criminal_case",
  //     entityScreenings.hadCriminalCase,
  //   );

  //   final String homeless = _getChoiceDescription(
  //     entityQuestion,
  //     "is_homeless",
  //     entityScreenings.homeless,
  //   );

  //   final String disabledPerson = _getChoiceDescription(
  //     entityQuestion,
  //     "disabled_person",
  //     entityScreenings.disabledPerson,
  //   );

  //   final String criminalCaseText = convertToString(
  //     entityCriminalcases
  //         .where((t) => t.id == entityScreenings.criminalCaseId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final String chronicContagiousText = convertToString(
  //     entityChroniccontagiouses
  //         .where((t) => t.id == entityScreenings.chronicContagiousId)
  //         .map((t) => t.name)
  //         .firstWhere(
  //           (name) => name != null,
  //           orElse: () => "",
  //         ),
  //   );

  //   final model = Screening(
  //     maritalStatusText: maritalStatusText,
  //     educationText: "",
  //     occupationText: "",
  //     incomeText: "",
  //     livingWithLast30days: "",
  //     parentRelationshipText: "",
  //     screeningDate: screeningDate,
  //     isToBeNumberOneMember: isToBeNumberOneMember,
  //     drugUsageApproach: drugUsageApproach,
  //     mainDrugText: mainDrugsTexts,
  //     mentalEvalLevel: mentalEvalLevel,
  //     drugEvalScore: drugEvalScore,
  //     levelOfAddicted: levelOfAddicted,
  //     screeningResult: screeningResult,
  //     frequencyOfUse: "",
  //     feelingAddicted: "",
  //     irresponsible: "",
  //     frequencyOfProblem: "",
  //     beNoticed: "",
  //     stopUsingButNotSuccess: "",
  //     injectableDrug: "",
  //     last3monthUsage: "",
  //     hadMentalTreatment: "",
  //     mentalTreatmentText: "",
  //     hadChronicContagious: "",
  //     chronicContagiousText: "",
  //     hadCriminalCase: "",
  //     criminalCaseText: "",
  //     homeless: "",
  //     disabledPerson: "",
  //     disabledCertificateNo: "",
  //   );

  //   return model;
  // }

  // Future<Treatment> findTreatment(int id) async {
  //   final entity = await treatmentApi.findScreenings(id, patientsid: id);
  //   final entityQuestion = await questionApi.findTreatmentQuestionChoices();

  //   final String treatmentDate = entity.treatmentDate != null
  //       ? convertThaiDate(entity.treatmentDate)
  //       : '';
  //   final String mentalEvalLevel = convertToString(entity.mentalEvalLevel);
  //   final String levelOfAddicted = convertToString(entity.levelOfAddicted);
  //   final int drugEvalScore = convertToInt(entity.drugEvalScore);
  //   final String treatmentResult = convertToString(entity.treatmentResult);
  //   final String evaluationDate = entity.evaluationDate != null
  //       ? convertThaiDate(entity.evaluationDate)
  //       : '';

  //   String evaluationResult = "";
  //   if (entity.evaluationResult == "COMPLETED") {
  //     evaluationResult = "ครบโปรแกรม";
  //   } else if (entity.evaluationResult == "INCOMPLETED") {
  //     evaluationResult = "ไม่ครบโปรแกรม (หยุดรับการบำบัดฟื้นฟู)";
  //   }

  //   final String mentalTreatmentResult = _getChoiceDescription(
  //     entityQuestion,
  //     "mental_treatment_result",
  //     entity.mentalTreatmentResult,
  //   );

  //   final String physicalTreatmentResult = _getChoiceDescription(
  //     entityQuestion,
  //     "phisical_treatment_result",
  //     entity.physicalTreatmentResult,
  //   );

  //   final model = Treatment(
  //     treatmentDate: treatmentDate,
  //     mentalEvalLevel: mentalEvalLevel,
  //     drugEvalScore: drugEvalScore,
  //     levelOfAddicted: levelOfAddicted,
  //     treatmentResult: treatmentResult,
  //     evaluationDate: evaluationDate,
  //     evaluationResult: evaluationResult,
  //     mentalTreatmentResult: mentalTreatmentResult,
  //     physicalTreatmentResult: physicalTreatmentResult,
  //   );

  //   return model;
  // }

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
