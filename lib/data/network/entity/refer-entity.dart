import 'package:json_annotation/json_annotation.dart';
part 'refer-entity.g.dart';

@JsonSerializable()
class SenderEntity {
  List<SenderContentEntity> content;
  int totalPages;
  int totalElements;
  SenderEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory SenderEntity.fromJson(Map<String, dynamic> json) =>
      _$SenderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SenderEntityToJson(this);
}

@JsonSerializable()
class SenderContentEntity {
  String? name;
  int? id;
  String? type;
  String? level;
  String? workflow;
  String? cycle;
  DateTime? createdAt;
  String? referTo;
  String? nationalId;
  String? surname;
  String? referFrom;
  String? referReason;
  String? responseReason;
  DateTime? responseDate;
  DateTime? referDate;
  String? referStatus;
  String? monitoringRoundType;
  int? referToId;
  int? referFromId;

  SenderContentEntity({
    required this.name,
    required this.id,
    required this.type,
    required this.level,
    required this.workflow,
    required this.cycle,
    required this.createdAt,
    required this.referTo,
    required this.nationalId,
    required this.surname,
    required this.referFrom,
    required this.referReason,
    required this.responseReason,
    required this.responseDate,
    required this.referDate,
    required this.referStatus,
    required this.monitoringRoundType,
    required this.referToId,
    required this.referFromId,
  });

  factory SenderContentEntity.fromJson(Map<String, dynamic> json) =>
      _$SenderContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SenderContentEntityToJson(this);
}
//------receiver-----

@JsonSerializable()
class ReceiverEntity {
  List<ReceiverContentEntity> content;
  int totalPages;
  int totalElements;
  ReceiverEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory ReceiverEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiverEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverEntityToJson(this);
}

@JsonSerializable()
class ReceiverContentEntity {
  String? name;
  int? id;
  String? type;
  String? level;
  String? workflow;
  String? cycle;
  DateTime? createdAt;
  String? referTo;
  String? nationalId;
  String? surname;
  String? referFrom;
  String? referReason;
  String? responseReason;
  DateTime? responseDate;
  DateTime? referDate;
  String? referStatus;
  String? monitoringRoundType;
  int? referToId;
  int? referFromId;

  ReceiverContentEntity({
    required this.name,
    required this.id,
    required this.type,
    required this.level,
    required this.workflow,
    required this.cycle,
    required this.createdAt,
    required this.referTo,
    required this.nationalId,
    required this.surname,
    required this.referFrom,
    required this.referReason,
    required this.responseReason,
    required this.responseDate,
    required this.referDate,
    required this.referStatus,
    required this.monitoringRoundType,
    required this.referToId,
    required this.referFromId,
  });

  factory ReceiverContentEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiverContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverContentEntityToJson(this);
}
//------receiver-----
