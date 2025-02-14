import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refer.freezed.dart';

@unfreezed
class SearchSender with _$SearchSender {
  factory SearchSender({
    required String searchVal,
    required List<ReferStatus> referStatus,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchSender;
}

@freezed
class Sender with _$Sender {
  const factory Sender({
    required int referFromId,
    required int referToId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required String referTo,
    required WorkFlowStatus? workFlowStatus,
    ReferStatus? referStatus,
  }) = _Sender;
}
//--receiver

@unfreezed
class SearchReceiver with _$SearchReceiver {
  factory SearchReceiver({
    required String searchVal,
    required List<ReferStatus> referStatus,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchReceiver;
}

@freezed
class Receiver with _$Receiver {
  const factory Receiver({
    required int referFromId,
    required int referToId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required String referTo,
    required WorkFlowStatus? workFlowStatus,
    ReferStatus? referStatus,
  }) = _Receiver;
}
