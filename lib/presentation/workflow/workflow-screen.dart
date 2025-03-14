import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/workflow/workflow-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/launch.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:bst_staff_mobile/widget/workflow/monitoring-card.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-drugusagebefore-card.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-evalresult-card.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-history-card.dart';
import 'package:bst_staff_mobile/widget/workflow/treatment-plan-card.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WorkflowScreen extends StatelessWidget {
  final int patientId;
  const WorkflowScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: const BaseAppBarBlank(
        title: 'ข้อมูลผู้ป่วย',
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: WorkflowContent(
                    patientId: patientId,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkflowContent extends StatefulWidget {
  final int patientId;
  const WorkflowContent({super.key, required this.patientId});

  @override
  State<WorkflowContent> createState() => _WorkflowContentState();
}

class _WorkflowContentState extends State<WorkflowContent> {
  late WorkflowModel _model;

  @override
  void initState() {
    super.initState();
    _model = WorkflowModel(
      log: Provider.of<Logger>(context, listen: false),
      workflowRepository:
          Provider.of<WorkflowRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorkflowModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(widget.patientId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<WorkflowModel>(
              builder: (context, model, child) {
                return DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,
                        indicatorColor: MainColors.primary300,
                        tabAlignment: TabAlignment.start,
                        dividerColor: Colors.transparent,
                        labelColor: MainColors.primary500,
                        labelPadding: EdgeInsets.only(right: 32),
                        tabs: [
                          Tab(
                            child: Text(
                              "ข้อมูลส่วนบุคคล",
                              style: TextStyle(fontSize: FontSizes.medium),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "คัดกรอง",
                              style: TextStyle(fontSize: FontSizes.medium),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "บำบัด",
                              style: TextStyle(fontSize: FontSizes.medium),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "ติดตาม",
                              style: TextStyle(fontSize: FontSizes.medium),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            if (model.registering != null) ...[
                              _buildRegistering(model.registering!),
                            ] else ...[
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: TextStyle(
                                      color: MainColors.text,
                                      fontSize: FontSizes.large,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (model.screening?.screeningDate != null) ...[
                              _buildScreening(model.screening!),
                            ] else ...[
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: TextStyle(
                                      color: MainColors.text,
                                      fontSize: FontSizes.large,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (model.treatment?.treatmentDate != null) ...[
                              _buildTreatment(model.treatment!),
                            ] else ...[
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: TextStyle(
                                      color: MainColors.text,
                                      fontSize: FontSizes.large,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (model.monitorings.isNotEmpty) ...[
                              _buildMonitoring(model.monitorings),
                            ] else ...[
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: TextStyle(
                                      color: MainColors.text,
                                      fontSize: FontSizes.large,
                                    ),
                                  ),
                                ],
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

  Widget _buildRegistering(Registering data) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    data.imagePath,
                    width: 100,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.fullname,
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.nationalId,
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: MainColors.divider,
                thickness: 0.6,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ข้อมูลลงทะเบียน",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  if (data.phoneNo.isNotEmpty) {
                    launchCaller(data.phoneNo);
                  }
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text(
                        "เบอร์โทร",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          color: MainColors.text,
                        ),
                      ),
                    ),
                    if (data.phoneNo.isEmpty) ...[
                      const Text(
                        "ไม่มีข้อมูล",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ] else ...[
                      const Icon(
                        Icons.phone_outlined,
                        color: MainColors.primary500,
                        size: FontSizes.medium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        data.phoneNo,
                        style: const TextStyle(
                          fontSize: 14,
                          color: MainColors.primary500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      "วันเดือนปีเกิด",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        color: MainColors.text,
                      ),
                    ),
                  ),
                  Text(
                    data.dateOfBirth,
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      "อายุ",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        color: MainColors.text,
                      ),
                    ),
                  ),
                  Text(
                    data.age,
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      "เพศ",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        color: MainColors.text,
                      ),
                    ),
                  ),
                  Text(
                    data.genderText,
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      "สัญชาติ",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        color: MainColors.text,
                      ),
                    ),
                  ),
                  Text(
                    data.nationality,
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      "ศาสนา",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        color: MainColors.text,
                      ),
                    ),
                  ),
                  Text(
                    data.religion,
                    style: const TextStyle(
                      fontSize: FontSizes.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ที่อยู่",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ที่อยู่ตามทะเบียนราษฎร์",
                style: TextStyle(color: Color(0xFF434343)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.registereAddress,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "ที่อยู่ปัจจุบัน",
                style: TextStyle(color: Color(0xFF434343)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.currentAddress,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "สถานภาพสมรส",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.maritalStatus,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "การศึกษา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.education,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "อาชีพ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.occupation,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "รายได้",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.income,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ข้อมูลผู้ปกครอง/ผู้ดูแล",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.guardianfullName,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  if (data.guardianPhoneNo.isNotEmpty) {
                    launchCaller(data.guardianPhoneNo);
                  }
                },
                child: Row(
                  children: [
                    const Text(
                      "เบอร์โทร",
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (data.guardianPhoneNo.isEmpty) ...[
                      const Text(
                        "-",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ] else ...[
                      const Icon(
                        Icons.phone_outlined,
                        color: MainColors.primary500,
                        size: FontSizes.medium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        data.guardianPhoneNo,
                        style: const TextStyle(
                          fontSize: 14,
                          color: MainColors.primary500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "อาศัยอยู่กับ (ในช่วง 30 วันที่ผ่านมา)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.livingWithText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "การเข้าสู่ระบบตามมาตรา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.joinTreatmentByText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.joinSentByCourtText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreening(Screening data) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "วันที่เข้ารับการคัดกรอง",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.screeningDate ?? "-",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประเมินพฤติกรรมก้าวร้าว (OAS)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LevelStatusTypeLabel(
                levelType: data.levelType,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "แบบประเมินพฤติกรรมการใช้ยาเสพติด (V2)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              DrugEvalResultStatusTypeLabel(
                drugEvalResult: data.drugEvalResult,
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                color: MainColors.divider,
                thickness: 0.6,
              ),
              const Text(
                "สมาชิก ToBeNumber ONE",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.isToBeNumberOneMember,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "วันที่เป็นสมาชิก : ${data.toBeNumberOneDate}",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "รูปแบบการเสพ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.drugUsageApproach,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ยาเสพติดหลักที่ใช้",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.mainDrug,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ยาเสพติดที่ใช้ร่วม",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.secondaryDrug,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "เคยใช้ยาเสพติดชนิดฉีดหรือไม่",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.injectableDrug,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประวัติรักษาโรคสุขภาพจิต",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.mentalTreatment,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประวัติโรคเรื้อรัง / โรคติดต่อ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.chronicContagious,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประวัติคดีอาญา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.criminalCase,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "คนเร่ร่อน ไร้ที่พักพิง",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.homeless,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ผู้พิการ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.disabledPerson,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "หมายเลขรับรองความพิการ : ${data.disabledCertificateNo}",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTreatment(Treatment data) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "วันที่เข้ารับการบำบัด",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.treatmentDate ?? "-",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประเมินพฤติกรรมก้าวร้าว (OAS)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LevelStatusTypeLabel(
                levelType: data.mentalEvalLevel,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "แบบประเมินพฤติกรรมการใช้ยาเสพติด (V2)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              DrugEvalResultStatusTypeLabel(
                drugEvalResult: data.treatmentResult,
              ),
              const Divider(
                color: MainColors.divider,
                thickness: 0.6,
              ),
              const Text(
                "สาเหตุสำคัญที่ใช้ยาเสพติดครั้งแรก",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.usageReasons,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ใช้ยาเสพติดครั้งแรก",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "${data.firstAgeUsage} ปี",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "ยาเสพติดที่ใช้ : ${data.firstDrugUsage}",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "การใช้ยาเสพติดในปัจจุบัน",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.currentDrugUsages,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ระยะเวลาที่ใช้",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "${data.totalUsage} ปี",
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "เคยเข้ารับการบำบัดรักษามาก่อนหรือไม่",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.hadTreatmentText,
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ข้อมูลการบำบัดรักษาในระบบ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentHistoryList(data.inHistories),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ข้อมูลการบำบัดรักษานอกระบบ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentHistoryList(data.outHistoryies),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "เหตุผลสำคัญที่เข้ารับการบำบัดรักษาครั้งนี้",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentList(data.joinReasons),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ชนิดยาเสพติดที่ใช้ก่อนมารักษา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildDrugUsageBeforeList(data.drugUsageBefores),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ประวัติการบำบัดรักษา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildPlanList(data.plans),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "การให้ยา",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentList(data.dosings),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "เทคนิคการบำบัดฟื้นฟูสมรรถภาพ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentList(data.techniques),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "โปรแกรมการบำบัดฟื้นฟูสมรรถภาพ",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentList(data.programmes),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "โปรแกรมการลดอันตรายจากการใช้ยาเสพติด (Harm reduction)",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ..._buildTreatmentList(data.harmItems),
              const SizedBox(
                height: 16,
              ),
              TreatmentEvalresultCard(
                status: data.evaluationResult,
                date: data.evaluationDate,
                completedReasonText: data.completedReasonText,
                mentalTreatmentResultText: data.mentalTreatmentResultText,
                physicalTreatmentResultText: data.physicalTreatmentResultText,
                incompletedReasonText: data.incompletedReasonText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTreatmentHistoryList(
    List<TreatmentHistory> datas,
  ) {
    if (datas.isEmpty) {
      return [
        const Text(
          "-",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
      ];
    }

    final List<Widget> dataCards = [];
    for (var i = 0; i < datas.length; i++) {
      dataCards.add(
        TreatmentHistoryCard(
          data: datas[i],
        ),
      );

      if (i < datas.length - 1) {
        dataCards.add(const SizedBox(height: 8));
      }
    }

    return dataCards;
  }

  List<Widget> _buildTreatmentList(
    List<String> datas,
  ) {
    if (datas.isEmpty) {
      return [
        const Text(
          "-",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
      ];
    }

    final List<Widget> dataCards = [];
    for (var i = 0; i < datas.length; i++) {
      dataCards.add(
        Row(
          children: [
            const Icon(Icons.circle, size: 8),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                datas[i],
                style: const TextStyle(
                  fontSize: FontSizes.medium,
                ),
              ),
            ),
          ],
        ),
      );

      if (i < datas.length - 1) {
        dataCards.add(const SizedBox(height: 8));
      }
    }

    return dataCards;
  }

  List<Widget> _buildDrugUsageBeforeList(
    List<DrugUsageBefore> datas,
  ) {
    if (datas.isEmpty) {
      return [
        const Text(
          "-",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
      ];
    }

    final List<Widget> dataCards = [];
    for (var i = 0; i < datas.length; i++) {
      dataCards.add(
        TreatmentDrugusagebeforeCard(
          data: datas[i],
        ),
      );

      if (i < datas.length - 1) {
        dataCards.add(const SizedBox(height: 8));
      }
    }

    return dataCards;
  }

  List<Widget> _buildPlanList(
    List<Plan> datas,
  ) {
    if (datas.isEmpty) {
      return [
        const Text(
          "-",
          style: TextStyle(
            fontSize: FontSizes.medium,
          ),
        ),
      ];
    }

    final List<Widget> dataCards = [];
    for (var i = 0; i < datas.length; i++) {
      dataCards.add(
        TreatmentPlanCard(
          data: datas[i],
        ),
      );

      if (i < datas.length - 1) {
        dataCards.add(const SizedBox(height: 8));
      }
    }

    return dataCards;
  }

  Widget _buildMonitoring(List<Monitoring> datas) {
    final latestResultDate = datas.isNotEmpty ? datas[0].latestResultDate : "";

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "สรุปผลการบำบัด",
              style: TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      "วันที่ประเมินผล : $latestResultDate",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "การติดตาม",
              style: TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (datas.isNotEmpty) ...[
              for (final data in datas) ...[
                MonitoringCard(data: data),
                const SizedBox(
                  height: 16,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
