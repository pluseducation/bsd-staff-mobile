import 'package:json_annotation/json_annotation.dart';
part 'network-error-entity.g.dart';

List<NetworkErrorEntity> networkErrorEntitysFromJson(List data) =>
    List<NetworkErrorEntity>.from(
      data.map((x) => NetworkErrorEntity.fromJson(x as Map<String, dynamic>)),
    );

@JsonSerializable()
class NetworkErrorEntity {
  String? status;
  String? message;

  NetworkErrorEntity({
    required this.status,
    required this.message,
  });

  factory NetworkErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$NetworkErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkErrorEntityToJson(this);
}
