import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-model.dart';
import 'package:bst_staff_mobile/presentation/dashboard/report-data-screen.dart';
import 'package:bst_staff_mobile/presentation/dashboard/repost-data-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/dashboard/dashboard-level.dart';
import 'package:bst_staff_mobile/widget/dashboard/dashboard-report-table.dart';
import 'package:bst_staff_mobile/widget/dashboard/dashboard-stat.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBarContent(title: 'แดชบอร์ด'),
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
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: const DashboardContent(),
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

class DashboardContent extends StatefulWidget {
  const DashboardContent({
    super.key,
  });

  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  late final DashboardModel _model;
  late final ReportDataModel _reportModel;

  @override
  void initState() {
    super.initState();
    _model = DashboardModel(
      log: Provider.of<Logger>(context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    _reportModel = ReportDataModel(
      log: Provider.of<Logger>(context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardModel>.value(
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
            return Consumer<DashboardModel>(
              builder: (context, model, child) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      Text(
                        model.dateNow,
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (model.patient) ...[
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildTotalPatient(model.totalPatient),
                                _buildRetention(model.retention),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildRegistering(
                                model.workflowCount.countRegistering,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildScreening(
                                model.workflowCount.countScreening,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTreatment(
                                model.workflowCount.countTreatment,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildMonitoring(
                                model.workflowCount.countMonitoring,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (model.assistance || model.refer) ...[
                        Row(
                          children: [
                            if (model.assistance) ...[
                              Expanded(
                                child: _buildAssistance(
                                  model.workflowCount.countAssistance,
                                ),
                              ),
                              if (model.refer) ...[
                                const SizedBox(width: 8),
                              ],
                            ],
                            if (model.refer) ...[
                              Expanded(
                                child: _buildRefer(
                                  model.referCount,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (model.patient) ...[
                        DashboardLevel(
                          level: model.level,
                        ),
                        const SizedBox(height: 8),
                        DashboardStat(
                          statPatientMonth: model.statPatientMonth,
                          statPatientWeek: model.statPatientWeek,
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (model.stat) ...[
                        DashboardReportTable(
                          model: _reportModel,
                        ),
                      ],
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildTotalPatient(int total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ผู้ป่วยทั้งหมด",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _model.numberFormat.format(total),
          style: const TextStyle(
            fontSize: FontSizes.large,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRetention(double retention) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "Retention Rate",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "${retention.toStringAsFixed(2)}%",
          style: const TextStyle(
            fontSize: FontSizes.large,
            fontWeight: FontWeight.bold,
            color: MainColors.primary500,
          ),
        ),
      ],
    );
  }

  Widget _buildRegistering(int registering) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ลงทะเบียน",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.numberFormat.format(registering),
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreening(int screening) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "คัดกรอง",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.numberFormat.format(screening),
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreatment(int treatment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "บำบัด",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.numberFormat.format(treatment),
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonitoring(int monitoring) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ติดตาม",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.numberFormat.format(monitoring),
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssistance(int assistance) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ช่วยเหลือ",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.numberFormat.format(assistance),
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRefer(ReferCount refer) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ส่งต่อ/รอรับ",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${_model.numberFormat.format(refer.sender)}/${_model.numberFormat.format(refer.receiver)}",
              style: const TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
