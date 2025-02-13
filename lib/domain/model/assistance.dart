import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistance.freezed.dart';

@unfreezed
class SearchAssistance with _$SearchAssistance {
  factory SearchAssistance({
    required String searchVal,
    required List<AssistanceStatus> assistanceStatus,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchAssistance;
}

@freezed
class Assistance with _$Assistance {
  const factory Assistance({
    required int latestRoundId,
    required int assistanceRoundId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required WorkFlowStatus? workFlowStatus,
    AssistanceStatus? assistanceStatus,
  }) = _Assistance;
}

@freezed
class AssistanceDetail with _$AssistanceDetail {
  const factory AssistanceDetail({
    required String assistanceTypeName,
    required String assistanceDepartmentName,
    required String assistanceSubDivisionName,
    required String remark,
    required AssistanceItemStatus? assistanceItemStatus,
  }) = _AssistanceDetail;
}
