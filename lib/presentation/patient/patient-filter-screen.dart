import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/patient/patient-filter.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class PatientSelectSearchScreen extends StatelessWidget {
  final SearchPatient search;
  const PatientSelectSearchScreen({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppBarContent(
        title: 'ตัวกรอง',
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MainColors.primary500,
                  Colors.white,
                ],
                stops: [-0.017, 1.2193],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(280 * (3.14159 / 50)),
              ),
              color: Colors.white12,
            ),
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
                                  value: search.searchVal,
                                  workFlowStatus: search.workFlowStatus,
                                  levelTypes: search.levelTypes,
                                  drugEvalResults: search.drugEvalResults,
                                  treatmentTypes: search.treatmentTypes,
                                  smivTypes: search.smivTypes,
                                  onSearch: onSearch,
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
        ],
      ),
    );
  }

  void onSearch(
    String value,
    List<WorkFlowStatus> workFlowStatus,
    List<LevelType> levelTypes,
    List<DrugEvalResult> drugEvalResults,
    List<TreatmentType> treatmentTypes,
    List<SmivType> smivTypes,
  ) {
    print(value);
  }
}
