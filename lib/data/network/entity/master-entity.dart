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

  //relationships
}

List<RelationshipsEntity> relationshipsFromJson(List data) =>
    List<RelationshipsEntity>.from(
      data.map((x) => RelationshipsEntity.fromJson(x as Map<String, dynamic>)),
    );

String relationshipsToJson(List<RelationshipsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class RelationshipsEntity {
  int? id;
  String? name;

  RelationshipsEntity({
    required this.id,
    required this.name,
  });

  factory RelationshipsEntity.fromJson(Map<String, dynamic> json) =>
      _$RelationshipsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipsEntityToJson(this);
}

//Villages

List<VillagesEntity> villagesFromJson(List data) => List<VillagesEntity>.from(
      data.map((x) => VillagesEntity.fromJson(x as Map<String, dynamic>)),
    );

String villagesToJson(List<VillagesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class VillagesEntity {
  int? id;
  String? name;

  VillagesEntity({
    required this.id,
    required this.name,
  });

  factory VillagesEntity.fromJson(Map<String, dynamic> json) =>
      _$VillagesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VillagesEntityToJson(this);
}
// provinces

List<ProvincesEntity> provincesFromJson(List data) =>
    List<ProvincesEntity>.from(
      data.map((x) => ProvincesEntity.fromJson(x as Map<String, dynamic>)),
    );

String provincesToJson(List<ProvincesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ProvincesEntity {
  int? id;
  String? name;

  ProvincesEntity({
    required this.id,
    required this.name,
  });

  factory ProvincesEntity.fromJson(Map<String, dynamic> json) =>
      _$ProvincesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesEntityToJson(this);
}

// districts

List<DistrictsEntity> districtsFromJson(List data) =>
    List<DistrictsEntity>.from(
      data.map((x) => DistrictsEntity.fromJson(x as Map<String, dynamic>)),
    );

String districtsToJson(List<DistrictsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class DistrictsEntity {
  int? id;
  String? name;

  DistrictsEntity({
    required this.id,
    required this.name,
  });

  factory DistrictsEntity.fromJson(Map<String, dynamic> json) =>
      _$DistrictsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictsEntityToJson(this);
}

// subdistricts

List<SubdistrictsEntity> subdistrictsFromJson(List data) =>
    List<SubdistrictsEntity>.from(
      data.map((x) => SubdistrictsEntity.fromJson(x as Map<String, dynamic>)),
    );

String subdistrictsToJson(List<SubdistrictsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class SubdistrictsEntity {
  int? id;
  String? name;

  SubdistrictsEntity({
    required this.id,
    required this.name,
  });

  factory SubdistrictsEntity.fromJson(Map<String, dynamic> json) =>
      _$SubdistrictsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubdistrictsEntityToJson(this);
}
