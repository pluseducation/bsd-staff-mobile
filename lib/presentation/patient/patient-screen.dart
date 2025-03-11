import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-filter-screen.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-model.dart';
import 'package:bst_staff_mobile/presentation/workflow/workflow-screen.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/patient/patient-card.dart';
import 'package:bst_staff_mobile/widget/patient/patient-search.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

// Global ValueNotifier to hold count changes
final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'ผู้ป่วย',
        valueListenable: dataNotifier,
      ),
      body: BaseBackground(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: const BoxDecoration(
              color: MainColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: PatientContent(dataNotifier: dataNotifier),
          ),
        ),
      ),
    );
  }
}

class PatientContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const PatientContent({super.key, required this.dataNotifier});

  @override
  State<PatientContent> createState() => _PatientContentState();
}

class _PatientContentState extends State<PatientContent> {
  late final PatientModel _model;

  @override
  void initState() {
    super.initState();
    _model = PatientModel(
      log: Provider.of<Logger>(context, listen: false),
      patientRepository: Provider.of<PatientRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(widget.dataNotifier),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<PatientModel>(
              builder: (context, model, child) {
                final patients = model.patients;
                return Column(
                  children: [
                    PatientSearch(
                      onClickFilter: _onClickFilter,
                      onValueChange: (value) async =>
                          await _model.searchByValue(value),
                      isFilter: model.isFilter,
                      controller: model.valueController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: patients.isEmpty
                          ? const Center(
                              child: Text(
                                'ไม่พบข้อมูล',
                                style: TextStyle(
                                  color: MainColors.text,
                                  fontSize: FontSizes.large,
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              child: Column(
                                children: _buildPatientCard(patients),
                              ),
                            ),
                    ),
                    CustomPagination(
                      currentPage: model.search.page,
                      totalPages: model.search.totalPages,
                      goToPage: (page) async {
                        await model.loadData(page);
                      },
                    ),
                  ],
                );
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

  Future<void> _onClickFilter() async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientFilterScreen(model: _model),
        ),
      );
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
