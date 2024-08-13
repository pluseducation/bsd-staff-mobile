import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'questionchoices-entity.g.dart';

List<QuestionChoicesEntity> questionChoicesEntityFromJson(List data) =>
    List<QuestionChoicesEntity>.from(
      data.map(
        (x) => QuestionChoicesEntity.fromJson(x as Map<String, dynamic>),
      ),
    );

String questionChoicesEntityToJson(List<QuestionChoicesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class QuestionChoicesEntity {
  QuestionEntity? question;
  List<ChoiceEntity>? choices;

  QuestionChoicesEntity({
    this.question,
    this.choices,
  });

  factory QuestionChoicesEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionChoicesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionChoicesEntityToJson(this);
}

@JsonSerializable()
class ChoiceEntity {
  String? choice;
  String? desc;
  List<ChoiceEntity>? choices;

  ChoiceEntity({
    this.choice,
    this.desc,
    this.choices,
  });

  factory ChoiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ChoiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceEntityToJson(this);
}

@JsonSerializable()
class QuestionEntity {
  String? question;
  String? desc;
  String? workflowType;

  QuestionEntity({
    this.question,
    this.desc,
    this.workflowType,
  });

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionEntityToJson(this);
}

// -----------------------

List<ScreeningsQuestionChoiceEntity> screeningsQuestionChoiceEntityFromJson(
  List<dynamic> data,
) =>
    List<ScreeningsQuestionChoiceEntity>.from(
      data.map(
        (x) =>
            ScreeningsQuestionChoiceEntity.fromJson(x as Map<String, dynamic>),
      ),
    );

String screeningsQuestionChoiceEntityToJson(
        List<ScreeningsQuestionChoiceEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ScreeningsQuestionChoiceEntity {
  Questionscreening? question;
  List<ChoiceScreeningsEntity>? choices;

  ScreeningsQuestionChoiceEntity({
    required this.question,
    required this.choices,
  });

  factory ScreeningsQuestionChoiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ScreeningsQuestionChoiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ScreeningsQuestionChoiceEntityToJson(this);
}

@JsonSerializable()
class ChoiceScreeningsEntity {
  String? choice;
  String? desc;
  dynamic choices;

  ChoiceScreeningsEntity({
    required this.choice,
    required this.desc,
    required this.choices,
  });

  factory ChoiceScreeningsEntity.fromJson(Map<String, dynamic> json) =>
      _$ChoiceScreeningsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceScreeningsEntityToJson(this);
}

@JsonSerializable()
class Questionscreening {
  String? question;
  String? desc;
  WorkflowType? workflowType;

  Questionscreening({
    required this.question,
    required this.desc,
    required this.workflowType,
  });

  factory Questionscreening.fromJson(Map<String, dynamic> json) =>
      _$QuestionscreeningFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionscreeningToJson(this);
}

enum WorkflowType { SCREENING }

final workflowTypeValues = EnumValues({"SCREENING": WorkflowType.SCREENING});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
