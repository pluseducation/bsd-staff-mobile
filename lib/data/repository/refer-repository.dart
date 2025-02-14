import 'package:bst_staff_mobile/data/network/api/refer-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/refer.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class ReferRepository {
  final ReferApi referApi;
  final NetworkMapper networkMapper;

  ReferRepository({
    required this.referApi,
    required this.networkMapper,
  });

  Future<List<Sender>> findSender({
    required SearchSender search,
  }) async {
    final entity = await referApi.findRefer(
      searchSender: search,
    );

    // set search
    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // set model
    final models = entity.content.map((item) {
      final fullname =
          '${convertToString(item.name)} ${convertToString(item.surname)}';
      return Sender(
        referFromId: convertToInt(item.referFromId),
        referToId: convertToInt(item.referToId),
        fullName: fullname,
        nationalId: convertToString(item.nationalId),
        cycle: convertToString(item.cycle),
        referTo: convertToString(item.referTo),
        workFlowStatus: WorkFlowStatus.setValue(item.workflow),
        referStatus: ReferStatus.setValue(item.referStatus),
      );
    }).toList();

    return models;
  }

  Future<List<Receiver>> findReceiver({
    required SearchReceiver search,
  }) async {
    final entity = await referApi.findReceiver(
      searchReceiver: search,
    );

    // set search
    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // set model
    final models = entity.content.map((item) {
      final fullname =
          '${convertToString(item.name)} ${convertToString(item.surname)}';
      return Receiver(
        referFromId: convertToInt(item.referFromId),
        referToId: convertToInt(item.referToId),
        fullName: fullname,
        nationalId: convertToString(item.nationalId),
        cycle: convertToString(item.cycle),
        referTo: convertToString(item.referTo),
        workFlowStatus: WorkFlowStatus.setValue(item.workflow),
        referStatus: ReferStatus.setValue(item.referStatus),
      );
    }).toList();

    return models;
  }
}
