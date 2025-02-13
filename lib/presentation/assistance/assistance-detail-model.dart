import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AssistanceDetailModel extends ChangeNotifier {
  final Logger log;
  final AssistanceRepository assistanceRepository;
  final AppService appService;

  late List<AssistanceDetail> assistanceDetail;

  AssistanceDetailModel({
    required this.log,
    required this.assistanceRepository,
    required this.appService,
  });

  Future<bool> initData(int assistanceRoundId) async {
    try {
      // this.
      assistanceDetail = await assistanceRepository.findAssistanceByRoundById(
        assistanceRoundId: assistanceRoundId,
      );

      return true;
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }
}
