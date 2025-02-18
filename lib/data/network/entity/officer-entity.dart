import 'package:json_annotation/json_annotation.dart';
part 'officer-entity.g.dart';

@JsonSerializable()
class OfficerEntity {
  List<OfficerContentEntity> content;
  int totalPages;
  int totalElements;

  OfficerEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory OfficerEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OfficerEntityToJson(this);
}

@JsonSerializable()
class OfficerContentEntity {
  int? id;
  String? nameTh;
  String? surnameTh;
  String? username;
  String? roleName;
  DateTime? createdAt;
  bool? active;

  OfficerContentEntity({
    required this.id,
    required this.nameTh,
    required this.surnameTh,
    required this.username,
    required this.roleName,
    required this.createdAt,
    required this.active,
  });

  factory OfficerContentEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficerContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OfficerContentEntityToJson(this);
}
