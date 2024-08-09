import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/registering-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/screening-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/treatment-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/workflow-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Workflow extends StatefulWidget {
  const Workflow({super.key});

  @override
  _WorkflowState createState() => _WorkflowState();
}

class _WorkflowState extends State<Workflow> {
  late final WorkflowdModel _model;

  @override
  void initState() {
    super.initState();
    _model = WorkflowdModel(
      log: Provider.of<Logger>(super.context, listen: false),
      workflowRepository:
          Provider.of<WorkflowRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    final result = _model.testvalue();

    // print("result-Workflow ==>>  $result");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainColors.background,
          title: const Text(
            "ข้อมูลผู้ป่วย",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Column(
          children: <Widget>[
            TabBar(
              labelColor: MainColors.primary500,
              unselectedLabelColor: Color(0xFF656C6F),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "ข้อมูลส่วนบุคคล",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "คัดกรอง",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "บำบัด",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  BaseLayoutScrollView(
                    child: Column(
                      children: [Registering()],
                    ),
                  ),
                  BaseLayoutScrollView(
                    child: Column(
                      children: [ScreeningScreen()],
                    ),
                  ),
                  // TreatmentScreen
                  BaseLayoutScrollView(
                    child: Column(
                      children: [TreatmentScreen()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
