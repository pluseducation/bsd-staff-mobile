import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/_dashboard/dashboard-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
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
      appBar: AppBar(
        backgroundColor: MainColors.background,
        title: Text(
          'ชื่อ : $parentName',
          style: const TextStyle(
            fontSize: FontSizes.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ReportDataTable(
              districtId: districtId,
              healthServiceId: healthServiceId,
            ),
          ],
        ),
      ),
    );
  }
}

class ReportDataTable extends StatefulWidget {
  final int districtId;
  final int healthServiceId;

  const ReportDataTable({
    super.key,
    required this.districtId,
    required this.healthServiceId,
  });

  @override
  State<ReportDataTable> createState() => _ReportDataTableState();
}

class _ReportDataTableState extends State<ReportDataTable> {
  late ReportDataProvider _model;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    _model = ReportDataProvider(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    await _model.initData(widget.districtId, widget.healthServiceId);
  }

  void _onSearchNameChanged(String value) {
    _model.search(value);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportDataProvider>.value(
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
            future: _model.findReportData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('ไม่พบข้อมูล'));
              } else {
                return Consumer<ReportDataProvider>(
                  builder: (context, model, child) {
                    final data = model.reportDatas;
                    return ConstrainedBox(
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
                        rowsPerPage: 10, // Set pagination to 10 rows per page
                        showCheckboxColumn: false,
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
        DataCell(
          (item.districtId > 0 || item.healthServiceId > 0)
              ? TextButton.icon(
                  onPressed: () {
                    // Handle button press
                  },
                  icon: const Icon(
                    Icons.visibility,
                  ), // Add your desired icon here
                  label: Text(item.name),
                )
              : Text(item.name),
        ),
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
