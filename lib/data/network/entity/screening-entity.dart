import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

@JsonSerializable()
class ScreeningEntity {
  int patientId;
  DateTime startDate;
  String refFilePath;
  String refFileName;
  int maritalStatusId;
  int educationId;
  int occupationId;
  String occupationOther;
  int incomeId;
  int parentRelationshipId;
  List<AnswerEntity> livingWithLast30Days;
  List<AnswerEntity> mainDrugs;
  List<AnswerEntity> secondaryDrugs;
  String isToBeNumberOneMember;
  String drugUsageApproach;
  String frequencyOfUse;
  String feelingAddicted;
  String frequencyOfProblem;
  String irresponsible;
  String beNoticed;
  String stopUsingButNotSuccess;
  int drugEvalScore;
  String levelOfAddicted;
  String screeningResult;
  String injectableDrug;
  String last3MonthUsage;
  List<int> mentalIssueIds;
  int mentalEvalScore;
  String mentalEvalLevel;
  String hadMentalTreatment;
  int mentalTreatmentId;
  String hadChronicContagious;
  int chronicContagiousId;
  String hadCriminalCase;
  int criminalCaseId;
  String homeless;
  String disabledPerson;
  String disabledCertificateNo;
  List<FileElement> files;
  List<NewFile> newFiles;
  List<int> removeDocIds;

  ScreeningEntity({
    required this.patientId,
    required this.startDate,
    required this.refFilePath,
    required this.refFileName,
    required this.maritalStatusId,
    required this.educationId,
    required this.occupationId,
    required this.occupationOther,
    required this.incomeId,
    required this.parentRelationshipId,
    required this.livingWithLast30Days,
    required this.mainDrugs,
    required this.secondaryDrugs,
    required this.isToBeNumberOneMember,
    required this.drugUsageApproach,
    required this.frequencyOfUse,
    required this.feelingAddicted,
    required this.frequencyOfProblem,
    required this.irresponsible,
    required this.beNoticed,
    required this.stopUsingButNotSuccess,
    required this.drugEvalScore,
    required this.levelOfAddicted,
    required this.screeningResult,
    required this.injectableDrug,
    required this.last3MonthUsage,
    required this.mentalIssueIds,
    required this.mentalEvalScore,
    required this.mentalEvalLevel,
    required this.hadMentalTreatment,
    required this.mentalTreatmentId,
    required this.hadChronicContagious,
    required this.chronicContagiousId,
    required this.hadCriminalCase,
    required this.criminalCaseId,
    required this.homeless,
    required this.disabledPerson,
    required this.disabledCertificateNo,
    required this.files,
    required this.newFiles,
    required this.removeDocIds,
  });
}

@JsonSerializable()
class AnswerEntity {
  String? answer;
  String? other;

  AnswerEntity({
    this.answer,
    this.other,
  });

  factory AnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerEntityToJson(this);
}
