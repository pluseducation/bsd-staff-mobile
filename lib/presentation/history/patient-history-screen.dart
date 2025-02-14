import 'package:bst_staff_mobile/data/repository/patient-history-repository.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/history/patient-history-model.dart';
import 'package:bst_staff_mobile/presentation/workflow/workflow-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/history/patient-history-card.dart';
import 'package:bst_staff_mobile/widget/history/patient-history-search.dart';
import 'package:bst_staff_mobile/widget/patient/patient-card.dart';
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
            return Column(
              children: [
                PatientHistorySearch(
                  onValueChange: _onSearch,
                  nameController: _model.nameController,
                  surnameController: _model.surnameController,
                  nationalIdController: _model.nationalIdController,
                  cycleController: _model.cycleController,
                ),
                const SizedBox(height: 16),
                Consumer<PatientHistoryModel>(
                  builder: (context, model, child) {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ..._buildPatientHistoryCard(model.historys),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
    // ----
  }

  List<Widget> _buildPatientHistoryCard(List<PatientHistory> datas) {
    final List<Widget> patientCards = [];

    for (var i = 0; i < datas.length; i++) {
      patientCards.add(
        PatientHistoryCard(
          data: datas[i],
        ),
      );

      if (i < datas.length - 1) {
        patientCards.add(const SizedBox(height: 16));
      }
    }

    return patientCards;
  }

  Future<void> _onSearch(String type) async {
    try {
      await _model.searchByValue(type);
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
