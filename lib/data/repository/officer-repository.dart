import 'package:bst_staff_mobile/data/network/api/officer-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/officer.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class OfficerRepository {
  final OfficerApi officerApi;
  final NetworkMapper networkMapper;

  OfficerRepository({
    required this.officerApi,
    required this.networkMapper,
  });

  Future<List<Officer>> findOfficer({
    required SearchOfficer search,
  }) async {
    final entity = await officerApi.findOfficer(
      searchOfficer: search,
    );

    // set search
    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // set model
    final models = entity.content.map((item) {
      final fullname =
          '${convertToString(item.nameTh)} ${convertToString(item.surnameTh)}';
      final active = item.active ?? false;

      return Officer(
        id: convertToInt(item.id),
        username: convertToString(item.username),
        active: active,
        fullName: fullname,
        roleName: convertToString(item.roleName),
      );
    }).toList();

    return models;
  }

  Future<void> updateOfficer({
    required int officerId,
    required bool active,
  }) async {
    await officerApi.updateOfficer(
      officerId: officerId,
      active: active,
    );
  }
}
