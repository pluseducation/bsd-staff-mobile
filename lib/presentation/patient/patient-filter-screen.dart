import 'package:bst_staff_mobile/presentation/patient/patient-model.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/patient/patient-filter.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class PatientFilterScreen extends StatelessWidget {
  final PatientModel model;
  const PatientFilterScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBarContent(
        title: 'ตัวกรอง',
      ),
      body: BaseBackground(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            PatientFilter(
                              value: model.search.searchVal,
                              workFlowStatus: model.search.workFlowStatus,
                              levelTypes: model.search.levelTypes,
                              drugEvalResults: model.search.drugEvalResults,
                              treatmentTypes: model.search.treatmentTypes,
                              smivTypes: model.search.smivTypes,
                              onSearch: (
                                value,
                                workFlowStatus,
                                levelTypes,
                                drugEvalResults,
                                treatmentTypes,
                                smivTypes,
                              ) {
                                onSearch(
                                  context,
                                  value,
                                  workFlowStatus,
                                  levelTypes,
                                  drugEvalResults,
                                  treatmentTypes,
                                  smivTypes,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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

  Future<void> onSearch(
    BuildContext context,
    String value,
    List<WorkFlowStatus> workFlowStatus,
    List<LevelType> levelTypes,
    List<DrugEvalResult> drugEvalResults,
    List<TreatmentType> treatmentTypes,
    List<SmivType> smivTypes,
  ) async {
    try {
      await model.searchByStatus(
        value,
        workFlowStatus,
        levelTypes,
        drugEvalResults,
        treatmentTypes,
        smivTypes,
      );

      // pop screen
      Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
