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

  get gender => null;

  get someStringField => null;

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
