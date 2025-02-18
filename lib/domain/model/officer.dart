import 'package:freezed_annotation/freezed_annotation.dart';
part 'officer.freezed.dart';

@unfreezed
class SearchOfficer with _$SearchOfficer {
  factory SearchOfficer({
    required String name,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchOfficer;
}

@freezed
class Officer with _$Officer {
  const factory Officer({
    required int id,
    required String username,
    required bool active,
    required String fullName,
    required String roleName,
  }) = _Officer;
}
