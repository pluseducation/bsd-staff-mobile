import 'package:bst_staff_mobile/data/repository/assistance-repository.dart';
import 'package:bst_staff_mobile/domain/model/assistance.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance-detail-screen.dart';
import 'package:bst_staff_mobile/presentation/assistance/assistance.model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/assistance/assistance-card.dart';
import 'package:bst_staff_mobile/widget/assistance/assistance-search.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class AssistanceScreen extends StatelessWidget {
  const AssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'ช่วยเหลือ',
        valueListenable: dataNotifier,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: AssistanceContent(dataNotifier: dataNotifier),
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

class AssistanceContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const AssistanceContent({
    super.key,
    required this.dataNotifier,
  });

  @override
  _AssistanceContentState createState() => _AssistanceContentState();
}

class _AssistanceContentState extends State<AssistanceContent> {
  late final AssistanceModel _model;

  @override
  void initState() {
    super.initState();
    _model = AssistanceModel(
      log: Provider.of<Logger>(context, listen: false),
      assistanceRepository:
          Provider.of<AssistanceRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AssistanceModel>.value(
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
            return Consumer<AssistanceModel>(
              builder: (context, model, child) {
                final assistance = model.assistance;
                final assistancePending = model.assistancePending;
                final assistanceInprogress = model.assistanceInprogress;
                final assistanceCompleted = model.assistanceCompleted;

                return DefaultTabController(
                  length: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AssistanceSearch(
                          onValueChange: (value) async {
                            await _model.searchByValue(value);
                          },
                        ),
                        TabBar(
                          isScrollable: true,
                          indicatorColor: MainColors.primary300,
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          labelColor: MainColors.primary500,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          tabs: [
                            _buildTab("ทั้งหมด", 0),
                            _buildTab(
                              "รอดำเนินการ",
                              _model.assistancePending.length,
                            ),
                            _buildTab(
                              "กำลังดำเนินการ",
                              _model.assistanceInprogress.length,
                            ),
                            _buildTab(
                              "เสร็จสิ้น",
                              model.assistanceCompleted.length,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildAssistanceTab(assistance),
                              _buildAssistanceTab(assistancePending),
                              _buildAssistanceTab(assistanceInprogress),
                              _buildAssistanceTab(assistanceCompleted),
                            ],
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
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildAssistanceTab(List<Assistance> assistance) {
    if (assistance.isEmpty) {
      return const Column(
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
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ..._buildAssistanceCard(assistance),
        ],
      ),
    );
  }

  List<Widget> _buildAssistanceCard(
    List<Assistance> assistance,
  ) {
    final List<Widget> patientCards = [];

    for (var i = 0; i < assistance.length; i++) {
      patientCards.add(
        AssistanceCard(
          assistance: assistance[i],
          onclickReport: (latestRoundId) {
            _onAssistanceReport(latestRoundId);
          },
        ),
      );

      if (i < assistance.length - 1) {
        patientCards.add(const SizedBox(height: 16));
      }
    }

    return patientCards;
  }

  Future<void> _onAssistanceReport(int latestRoundId) async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AssistanceDetailScreen(
            latestRoundId: latestRoundId,
          ),
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

Widget _buildTab(String title, int? count) {
  return Tab(
    child: Row(
      children: [
        Text(title, style: const TextStyle(fontSize: FontSizes.small)),
        if (title != "ทั้งหมด") ...[
          const SizedBox(width: 4),
          _buildBadge(count ?? 0),
        ],
      ],
    ),
  );
}

Widget _buildBadge(int count) {
  return Container(
    width: 24,
    height: 24,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
    child: Text(
      count.toString(),
      style: const TextStyle(
        fontSize: FontSizes.text,
        color: MainColors.text,
      ),
    ),
  );
}
