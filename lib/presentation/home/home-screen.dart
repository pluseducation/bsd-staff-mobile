import 'package:bst_staff_mobile/data/repository/home-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance-screen.dart';
import 'package:bst_staff_mobile/presentation/home/home-model.dart';
import 'package:bst_staff_mobile/presentation/refer/refer-screen.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBarHome(),
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
                    child: const HomeContent(),
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

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late final HomeModel _model;

  @override
  void initState() {
    super.initState();
    _model = HomeModel(
      log: Provider.of<Logger>(context, listen: false),
      homeRepository: Provider.of<HomeRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>.value(
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
            return Consumer<HomeModel>(
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
                      const SizedBox(height: 16),
                      if (model.patient) ...[
                        Row(
                          children: [
                            Expanded(
                              child: _buildTotalPatient(model.totalPatient),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildRetention(model.retention),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildRegistering(
                                model.workflowCount.countRegistering,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildScreening(
                                model.workflowCount.countScreening,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTreatment(
                                model.workflowCount.countTreatment,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildMonitoring(
                                model.workflowCount.countMonitoring,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                      // Use LayoutBuilder to calculate the available height
                      SizedBox(
                        height: 250,
                        child: Row(
                          children: [
                            if (model.assistance) ...[
                              Expanded(
                                child: _buildAssistance(
                                  model.workflowCount.countAssistance,
                                ),
                              ),
                              if (model.refer) ...[
                                const SizedBox(width: 16),
                              ],
                            ],
                            if (model.refer) ...[
                              Expanded(
                                child: _buildRefer(model.referCount),
                              ),
                            ],
                          ],
                        ),
                      ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
        ),
      ),
    );
  }

  Widget _buildRetention(double retention) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                color: MainColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistering(int registering) {
    return Card(
      color: PatientStatusColors.registeringLight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // icon from image asset
                Image.asset('assets/images/home_registering.png', height: 16),
                const SizedBox(width: 8),
                const Text(
                  "ลงทะเบียน",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
      color: PatientStatusColors.screeningLight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // icon from image asset
                Image.asset('assets/images/home_screening.png', height: 16),
                const SizedBox(width: 8),
                const Text(
                  "คัดกรอง",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
      color: PatientStatusColors.treatmentLight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // icon from image asset
                Image.asset('assets/images/home_treatment.png', height: 16),
                const SizedBox(width: 8),
                const Text(
                  "บำบัด",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
      color: PatientStatusColors.monitoringLight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // icon from image asset
                Image.asset('assets/images/home_monitoring.png', height: 16),
                const SizedBox(width: 8),
                const Text(
                  "ติดตาม",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AssistanceScreen(),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/home_assistance.png',
                          height: 16),
                      const SizedBox(width: 8),
                      const Text(
                        "ช่วยเหลือ",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                  // icon next
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: FontSizes.medium,
                    color: MainColors.primary500,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                _model.numberFormat.format(assistance),
                style: const TextStyle(
                  fontSize: FontSizes.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "ทั้งหมด",
                style: TextStyle(
                  fontSize: FontSizes.large,
                  color: MainColors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRefer(ReferCount refer) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReferScreen(),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/home_refer.png', height: 16),
                      const SizedBox(width: 8),
                      const Text(
                        "ส่งต่อ/รอรับ",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                  // icon next
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: FontSizes.medium,
                    color: MainColors.primary500,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                _model.numberFormat.format(refer.receiver + refer.sender),
                style: const TextStyle(
                  fontSize: FontSizes.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "ทั้งหมด",
                style: TextStyle(
                  fontSize: FontSizes.large,
                  color: MainColors.text,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: MainColors.primary500,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "ส่งต่อ",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          color: MainColors.text,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _model.numberFormat.format(refer.sender),
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                      color: MainColors.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: MainColors.primary500,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "รอรับ",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          color: MainColors.text,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _model.numberFormat.format(refer.receiver),
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                      color: MainColors.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
