import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/dashboard/repost-data-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as lg;
import 'package:provider/provider.dart';

class ReportDataScreen extends StatelessWidget {
  final String parentName;
  final int districtId;
  final int healthServiceId;

  const ReportDataScreen({
    super.key,
    required this.parentName,
    required this.districtId,
    required this.healthServiceId,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDate = DateTime.now();

    return Scaffold(
      appBar: BaseAppBarBlank(
        title: 'ชื่อ : $parentName',
      ),
      body: Column(
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
                  child: ReportDataContent(
                    districtId: districtId,
                    healthServiceId: healthServiceId,
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

class ReportDataContent extends StatefulWidget {
  final int districtId;
  final int healthServiceId;

  const ReportDataContent({
    super.key,
    required this.districtId,
    required this.healthServiceId,
  });

  @override
  State<ReportDataContent> createState() => _ReportDataContentState();
}

class _ReportDataContentState extends State<ReportDataContent> {
  late ReportDataModel _model;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    _model = ReportDataModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  void _onSearchNameChanged(String value) {
    _model.search(value);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportDataModel>.value(
      value: _model,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'รายงาน',
            style: TextStyle(
              fontSize: FontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ), // Set the maximum width here
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "ค้นหาจากชื่อ",
              ),
              onChanged: _onSearchNameChanged,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FutureBuilder<bool>(
            future:
                _model.initData("", widget.healthServiceId, widget.districtId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('ไม่พบข้อมูล'));
              } else {
                return Consumer<ReportDataModel>(
                  builder: (context, model, child) {
                    final data = model.report;
                    if (data.isEmpty) {
                      return const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            'ไม่พบข้อมูล',
                            style: TextStyle(
                              color: MainColors.text,
                              fontSize: FontSizes.large,
                            ),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                          ),
                          child: PaginatedDataTable(
                            columns: const [
                              DataColumn(
                                label: Flexible(
                                  child: Text('ชื่อ'),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text('ลงทะเบียน'),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text('คัดกรอง'),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text('บำบัด'),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text('ติดตาม'),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text('Retention Rate %'),
                                ),
                              ),
                            ],
                            source: ReportDataTableSource(data),
                            showCheckboxColumn: false,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ReportDataTableSource extends DataTableSource {
  final List<ReportData> data;

  ReportDataTableSource(this.data);

  @override
  DataRow getRow(int index) {
    final item = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(item.name)),
        DataCell(Text(item.register)),
        DataCell(Text(item.screening)),
        DataCell(Text(item.treatment)),
        DataCell(Text(item.monitoring)),
        DataCell(Text(item.retentionRate)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
