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

// /master/educations

List<EducationsEntity> educationsFromJson(List data) =>
    List<EducationsEntity>.from(
      data.map((x) => EducationsEntity.fromJson(x as Map<String, dynamic>)),
    );

String educationsToJson(List<EducationsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class EducationsEntity {
  int? id;
  String? name;

  EducationsEntity({
    required this.id,
    required this.name,
  });

  factory EducationsEntity.fromJson(Map<String, dynamic> json) =>
      _$EducationsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EducationsEntityToJson(this);
}

// OccupationsEntity

List<OccupationsEntity> occupationsFromJson(List data) =>
    List<OccupationsEntity>.from(
      data.map((x) => OccupationsEntity.fromJson(x as Map<String, dynamic>)),
    );

String occupationsToJson(List<OccupationsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class OccupationsEntity {
  int? id;
  String? name;

  OccupationsEntity({
    required this.id,
    required this.name,
  });

  factory OccupationsEntity.fromJson(Map<String, dynamic> json) =>
      _$OccupationsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OccupationsEntityToJson(this);
}

// ----
List<IncomesEntity> IncomesFromJson(List data) => List<IncomesEntity>.from(
      data.map((x) => IncomesEntity.fromJson(x as Map<String, dynamic>)),
    );

String incomesToJson(List<IncomesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class IncomesEntity {
  int? id;
  String? name;

  IncomesEntity({
    required this.id,
    required this.name,
  });

  factory IncomesEntity.fromJson(Map<String, dynamic> json) =>
      _$IncomesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IncomesEntityToJson(this);
}

// MaritalstatusesEntity

List<MaritalstatusesEntity> maritalstatusesFromJson(List data) =>
    List<MaritalstatusesEntity>.from(
      data.map(
          (x) => MaritalstatusesEntity.fromJson(x as Map<String, dynamic>)),
    );

String maritalstatusesToJson(List<MaritalstatusesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class MaritalstatusesEntity {
  int? id;
  String? name;

  MaritalstatusesEntity({
    required this.id,
    required this.name,
  });

  factory MaritalstatusesEntity.fromJson(Map<String, dynamic> json) =>
      _$MaritalstatusesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MaritalstatusesEntityToJson(this);
}

//----------------------

List<RelationshipsValueEntity> relationshipsvalueFromJson(List data) =>
    List<RelationshipsValueEntity>.from(
      data.map(
          (x) => RelationshipsValueEntity.fromJson(x as Map<String, dynamic>)),
    );

String relationshipsvalueToJson(List<RelationshipsValueEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class RelationshipsValueEntity {
  int? id;
  String? name;

  RelationshipsValueEntity({
    required this.id,
    required this.name,
  });

  factory RelationshipsValueEntity.fromJson(Map<String, dynamic> json) =>
      _$RelationshipsValueEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipsValueEntityToJson(this);
}

// ---

List<DrugsEntity> drugsFromJson(List data) => List<DrugsEntity>.from(
      data.map((x) => DrugsEntity.fromJson(x as Map<String, dynamic>)),
    );

String drugsToJson(List<DrugsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class DrugsEntity {
  int? id;
  String? name;

  DrugsEntity({
    required this.id,
    required this.name,
  });

  factory DrugsEntity.fromJson(Map<String, dynamic> json) =>
      _$DrugsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DrugsEntityToJson(this);
}

// MentaltreatmentsEntity

List<MentaltreatmentsEntity> mentaltreatmentsFromJson(List data) =>
    List<MentaltreatmentsEntity>.from(
      data.map(
          (x) => MentaltreatmentsEntity.fromJson(x as Map<String, dynamic>)),
    );

String mentaltreatmentsToJson(List<MentaltreatmentsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class MentaltreatmentsEntity {
  int? id;
  String? name;

  MentaltreatmentsEntity({
    required this.id,
    required this.name,
  });

  factory MentaltreatmentsEntity.fromJson(Map<String, dynamic> json) =>
      _$MentaltreatmentsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MentaltreatmentsEntityToJson(this);
}

// MriminalcasesEntity

List<MriminalcasesEntity> criminalcasesFromJson(List data) =>
    List<MriminalcasesEntity>.from(
      data.map((x) => MriminalcasesEntity.fromJson(x as Map<String, dynamic>)),
    );

String criminalcasesToJson(List<MriminalcasesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class MriminalcasesEntity {
  int? id;
  String? name;

  MriminalcasesEntity({
    required this.id,
    required this.name,
  });

  factory MriminalcasesEntity.fromJson(Map<String, dynamic> json) =>
      _$MriminalcasesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MriminalcasesEntityToJson(this);
}
