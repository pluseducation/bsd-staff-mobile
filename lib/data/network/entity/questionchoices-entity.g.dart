// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionchoices-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionChoicesEntity _$QuestionChoicesEntityFromJson(
        Map<String, dynamic> json) =>
    QuestionChoicesEntity(
      question: json['question'] == null
          ? null
          : QuestionEntity.fromJson(json['question'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChoiceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionChoicesEntityToJson(
        QuestionChoicesEntity instance) =>
    <String, dynamic>{
      'question': instance.question,
      'choices': instance.choices,
    };

ChoiceEntity _$ChoiceEntityFromJson(Map<String, dynamic> json) => ChoiceEntity(
      choice: json['choice'] as String?,
      desc: json['desc'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChoiceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChoiceEntityToJson(ChoiceEntity instance) =>
    <String, dynamic>{
      'choice': instance.choice,
      'desc': instance.desc,
      'choices': instance.choices,
    };

QuestionEntity _$QuestionEntityFromJson(Map<String, dynamic> json) =>
    QuestionEntity(
      question: json['question'] as String?,
      desc: json['desc'] as String?,
      workflowType: json['workflowType'] as String?,
    );

Map<String, dynamic> _$QuestionEntityToJson(QuestionEntity instance) =>
    <String, dynamic>{
      'question': instance.question,
      'desc': instance.desc,
      'workflowType': instance.workflowType,
    };
