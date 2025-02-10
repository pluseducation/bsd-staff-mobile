import 'package:bst_staff_mobile/data/network/api/assistance-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class AssistanceRepository {
  final AssistanceApi assistanceApi;
  final NetworkMapper networkMapper;

  AssistanceRepository({
    required this.assistanceApi,
    required this.networkMapper,
  });

  Future<List<Assistance>> findAssistanceAll({
    required SearchAssistance search,
  }) async {
    final entity = await assistanceApi.findAssistance(
      searchAssistance: search,
    );

    // set search
    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // set model
    final models = entity.content.map((item) {
      final fullname =
          convertToString(item.name) + convertToString(item.surname);
      return Assistance(
        assistanceRoundId: convertToInt(item.latestRoundId),
        fullName: fullname,
        nationalId: convertToString(item.nationalId),
        cycle: convertToString(item.cycle),
        workFlowStatus: WorkFlowStatus.setValue(item.workflowType),
        assistanceStatus: AssistanceStatus.setValue(item.assistanceStatus),
      );
    }).toList();

    return models;
  }
}
