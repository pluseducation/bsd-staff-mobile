import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/api/patient-api.dart';
import 'package:bst_staff_mobile/data/network/api/questionchoices-api.dart';
import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';

class WorkflowRepository {
  final PatientApi patientApi;
  final MasterApi masterApi;
  final Question questionApi;
  final NetworkMapper networkMapper;

  WorkflowRepository({
    required this.patientApi,
    required this.masterApi,
    required this.questionApi,
    required this.networkMapper,
  });

  Future<List<QuestionChoicesEntity>> findQuestionChoices({
    required String findByWorkflowType,
  }) async {
    try {
      final entity = await questionApi.findQuestionChoices(
        findbyworkflowtype: "REGISTERING",
      );

      print('Entity======>>>>: $entity');
      return entity;
    } catch (e) {
      print('Error fetching question choices: $e');
      rethrow;
    }
  }
}
