import 'package:bst_staff_mobile/data/repository/patient-history-repository.dart';
import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/history/patient-history-model.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-filter-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-model.dart';
import 'package:bst_staff_mobile/presentation/workflow/workflow-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/patient/patient-card.dart';
import 'package:bst_staff_mobile/widget/patient/patient-search.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PatientHistoryScreen extends StatelessWidget {
  const PatientHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBarContent(
        title: 'ค้นหาผู้ป่วย',
      ),
      body: BaseBackground(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: MainColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: const PatientHistoryContent(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientHistoryContent extends StatefulWidget {
  const PatientHistoryContent({super.key});

  @override
  State<PatientHistoryContent> createState() => _PatientHistoryContentState();
}

class _PatientHistoryContentState extends State<PatientHistoryContent> {
  late final PatientHistoryModel _model;

  @override
  void initState() {
    super.initState();
    _model = PatientHistoryModel(
      log: Provider.of<Logger>(context, listen: false),
      patientHistoryRepository:
          Provider.of<PatientHistoryRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientHistoryModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<PatientHistoryModel>(
              builder: (context, model, child) {
                final historys = model.historys;
                return Stack(
                  children: [
                    // position top
                    // PatientSearch(
                    //   onClickFilter: _onClickFilter,
                    //   onValueChange: (value) async =>
                    //       await _model.searchByValue(value),
                    //   isFilter: model.isFilter,
                    //   controller: model.valueController,
                    // ),
                    // if (patients.isEmpty) ...[
                    //   const Positioned(
                    //     top: 0,
                    //     left: 0,
                    //     right: 0,
                    //     bottom: 0,
                    //     child: Expanded(
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             'ไม่พบข้อมูล',
                    //             style: TextStyle(
                    //               color: MainColors.text,
                    //               fontSize: 24,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ] else ...[
                    //   Positioned(
                    //     top: 60,
                    //     left: 0,
                    //     right: 0,
                    //     bottom: 0,
                    //     child: Column(
                    //       children: [
                    //         Expanded(
                    //           child: SingleChildScrollView(
                    //             child: Column(
                    //               children: [
                    //                 ..._buildPatientCard(patients),
                    //               ],
                    //             ),
                    //           ),
                    //         ),

                    //         // wrap position bottom
                    //         CustomPagination(
                    //           currentPage: model.search.page,
                    //           totalPages: model.search.totalPages,
                    //           goToPage: (page) async {
                    //             await model.loadData(page);
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ],
                  ],
                );

                // ----
              },
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildPatientCard(List<Patient> patients) {
    final List<Widget> patientCards = [];

    for (var i = 0; i < patients.length; i++) {
      patientCards.add(
        GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkflowScreen(
                  patientId: patients[i].patientId,
                ),
              ),
            );
          },
          child: PatientCard(
            patient: patients[i],
          ),
        ),
      );

      if (i < patients.length - 1) {
        patientCards.add(const SizedBox(height: 16));
      }
    }

    return patientCards;
  }

  // Future<void> _onClickFilter() async {
  //   try {
  //     await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PatientFilterScreen(model: _model),
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     if (!context.mounted) return;

  //     await showInfoDialog(
  //       context: context,
  //       message: e.toString(),
  //     );
  //   }
  // }
}
