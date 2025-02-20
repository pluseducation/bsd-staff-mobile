import 'package:bst_staff_mobile/data/repository/officer-repository.dart';
import 'package:bst_staff_mobile/domain/model/officer.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/officer/officer-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/officer/officer-card.dart';
import 'package:bst_staff_mobile/widget/officer/officer-search.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class OfficerScreen extends StatelessWidget {
  const OfficerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'จัดการบัญชีผู้ใช้',
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
                      child: OfficerContent(dataNotifier: dataNotifier),
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

class OfficerContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;

  const OfficerContent({
    super.key,
    required this.dataNotifier,
  });

  @override
  State<OfficerContent> createState() => _OfficerContentState();
}

class _OfficerContentState extends State<OfficerContent> {
  late final OfficerModel _model;

  @override
  void initState() {
    super.initState();
    _model = OfficerModel(
      log: Provider.of<Logger>(context, listen: false),
      officerRepository: Provider.of<OfficerRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OfficerModel>.value(
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
            return Consumer<OfficerModel>(
              builder: (context, model, child) {
                final officer = model.officer;
                final officerActive = model.officerActive;
                final officerInactive = model.officerInactive;

                return DefaultTabController(
                  length: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        OfficerSearch(
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
                              "ใช้งาน",
                              _model.officerActive.length,
                            ),
                            _buildTab(
                              "ระงับการใช้งาน",
                              _model.officerInactive.length,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildOfficerTab(officer),
                              _buildOfficerTab(officerActive),
                              _buildOfficerTab(officerInactive),
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

  Widget _buildOfficerTab(List<Officer> officer) {
    if (officer.isEmpty) {
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
          ..._buildAssistanceCard(officer),
        ],
      ),
    );
  }

  List<Widget> _buildAssistanceCard(
    List<Officer> officer,
  ) {
    final List<Widget> patientCards = [];

    for (var i = 0; i < officer.length; i++) {
      patientCards.add(
        OfficerCard(
          officer: officer[i],
          onclickOfficer: (id) {
            _onOfficer(id);
          },
          onUpdateOfficer: (id, value) {
            _onUpdateOfficer(id, value);
          },
        ),
      );

      if (i < officer.length - 1) {
        patientCards.add(const SizedBox(height: 16));
      }
    }

    return patientCards;
  }

  Future<void> _onOfficer(int id) async {
    try {
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => pageContent(
      //       id: id,
      //     ),
      //   ),
      // );
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> _onUpdateOfficer(int id, bool value) async {
    try {
      await _model.updateOfficer(
        id,
        value,
      );

      // await _model.loadData(_model.search.page);
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
