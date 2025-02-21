import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/presentation/dashboard/report-data-screen.dart';
import 'package:bst_staff_mobile/presentation/dashboard/repost-data-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardReportTable extends StatefulWidget {
  final ReportDataModel model;
  const DashboardReportTable({super.key, required this.model});

  @override
  State<DashboardReportTable> createState() => _ReportDataTableState();
}

class _ReportDataTableState extends State<DashboardReportTable> {
  late ReportDataModel _model;

  @override
  void initState() {
    super.initState();
    _model = widget.model;
  }

  void _onSearchNameChanged(String value) {
    _model.search(value);
  }

  void _onClickRow(ReportData data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDataScreen(
          parentName: data.name,
          districtId: data.districtId,
          healthServiceId: data.healthServiceId,
        ),
      ),
    );
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
            future: _model.initData("", 0, 0),
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
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      child: PaginatedDataTable(
                        columns: const [
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'ชื่อ',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'ลงทะเบียน',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'คัดกรอง',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'บำบัด',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'ติดตาม',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Flexible(
                              child: Text(
                                'Retention Rate %',
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                ),
                              ),
                            ),
                          ),
                        ],
                        source: ReportDataTableSource(data, _onClickRow),
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
  final void Function(ReportData) onClickRow;

  ReportDataTableSource(this.data, this.onClickRow);

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
                    onClickRow(item);
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
