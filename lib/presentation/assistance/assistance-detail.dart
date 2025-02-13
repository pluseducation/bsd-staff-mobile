import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance.model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: AssistanceReportContent(latestRoundId: latestRoundId),
              ),
            ),
          ),
        ],
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

//intitState
  @override
  void initState() {
    super.initState();

    _model = AssistanceDetailModel(
      log: Provider.of<Logger>(context, listen: false),
      assistanceDetailRepository:
          Provider.of<AssistanceDetailRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
    // _model.initData(widget.latestRoundId);
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
                final historys = model.assistanceDetail;
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
                      child: const Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0, left: 16.0, right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1.การศึกษา",
                                      style: TextStyle(
                                        fontSize: FontSizes.medium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // WorkFlowStatusType(
                                    //   workFlowStatus: assistance.workFlowStatus,
                                    // ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0x804F4F4F),
                                thickness: 0.6,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                  top: 8.0,
                                  bottom: 16.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "หน่วยงานที่รับผิดชอบ",
                                      style: TextStyle(
                                        fontSize: FontSizes.medium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "ศูนย์ฟื้นฟูสภาพทางสังคมจังหวัดนครราชสีมา สาขาอำเภอปากช่อง",
                                      style: TextStyle(
                                        fontSize: FontSizes.small,
                                        color: MainColors.text,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "หน่วยงานที่รับผิดชอบโดยตรง",
                                      style: TextStyle(
                                        fontSize: FontSizes.medium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "สำนักงานศึกษาธิการจังหวัดนครราชสีมา",
                                      style: TextStyle(
                                        fontSize: FontSizes.small,
                                        color: MainColors.text,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "หมายเหตุ",
                                      style: TextStyle(
                                        fontSize: FontSizes.medium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "ขอทุนเปิดร้านขายหมูปิ้ง 1000 บาท",
                                      style: TextStyle(
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
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
