import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'master-entity.g.dart';

// -----------NationalityEntity
List<NationalityEntity> nationalitiesFromJson(List data) =>
    List<NationalityEntity>.from(
      data.map((x) => NationalityEntity.fromJson(x as Map<String, dynamic>)),
    );

String nationalitiesToJson(List<NationalityEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class NationalityEntity {
  int? id;
  String? name;

  NationalityEntity({
    required this.id,
    required this.name,
  });

  factory NationalityEntity.fromJson(Map<String, dynamic> json) =>
      _$NationalityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NationalityEntityToJson(this);
}

// ------ReligionsEntity

List<ReligionsEntity> religionsFromJson(List data) =>
    List<ReligionsEntity>.from(
      data.map((x) => ReligionsEntity.fromJson(x as Map<String, dynamic>)),
    );

String religionsToJson(List<ReligionsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ReligionsEntity {
  int? id;
  String? name;

  ReligionsEntity({
    required this.id,
    required this.name,
  });

  factory ReligionsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReligionsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReligionsEntityToJson(this);
}
