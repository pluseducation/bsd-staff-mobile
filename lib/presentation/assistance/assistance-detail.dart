import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance.model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/assistance/assistance.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AssistanceReportScreen extends StatelessWidget {
  final int latestRoundId;
  const AssistanceReportScreen({
    super.key,
    required this.latestRoundId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: AppBar(
        backgroundColor: MainColors.background,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'รายการความช่วยเหลือ',
            style: TextStyle(
              fontSize: FontSizes.medium,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AssistanceReportContent(latestRoundId: latestRoundId),
            ),
          ),
        ),
      ),
    );
  }
}

class AssistanceReportContent extends StatefulWidget {
  final int latestRoundId;
  const AssistanceReportContent({super.key, required this.latestRoundId});

  @override
  State<AssistanceReportContent> createState() =>
      _AssistanceReportContentState();
}

class _AssistanceReportContentState extends State<AssistanceReportContent> {
  late AssistanceDetailModel _model;

  @override
  void initState() {
    super.initState();

    _model = AssistanceDetailModel(
      log: Provider.of<Logger>(context, listen: false),
      assistanceRepository:
          Provider.of<AssistanceRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AssistanceDetailModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(widget.latestRoundId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<AssistanceDetailModel>(
              builder: (context, model, child) {
                final assistanceDetails = model.assistanceDetail;
                return Column(
                  children: assistanceDetails.map((detail) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFDEE2E4),
                              width: 0.6,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16.0,
                                      right: 16.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          detail.assistanceTypeName,
                                          style: const TextStyle(
                                            fontSize: FontSizes.medium,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        AssistanceItemStatusType(
                                          assistanceItemStatus:
                                              detail.assistanceItemStatus,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Color(0x804F4F4F),
                                    thickness: 0.6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16.0,
                                      left: 16.0,
                                      top: 8.0,
                                      bottom: 16.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "หน่วยงานที่รับผิดชอบ",
                                          style: const TextStyle(
                                            fontSize: FontSizes.medium,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          detail.assistanceDepartmentName,
                                          style: const TextStyle(
                                            fontSize: FontSizes.small,
                                            color: MainColors.text,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "หน่วยงานที่รับผิดชอบโดยตรง",
                                          style: TextStyle(
                                            fontSize: FontSizes.medium,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          detail.assistanceSubDivisionName,
                                          style: const TextStyle(
                                            fontSize: FontSizes.small,
                                            color: MainColors.text,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "หมายเหตุ",
                                          style: TextStyle(
                                            fontSize: FontSizes.medium,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          detail.remark,
                                          style: const TextStyle(
                                            fontSize: FontSizes.small,
                                            color: MainColors.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
