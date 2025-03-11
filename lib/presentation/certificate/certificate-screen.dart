import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-detail-screen.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate-card.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate-search.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'ใบรับรอง',
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
                      child: CertificateContent(dataNotifier: dataNotifier),
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

class CertificateContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const CertificateContent({
    super.key,
    required this.dataNotifier,
  });

  @override
  State<CertificateContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CertificateContent> {
  late final CertificateModel _model;

  @override
  void initState() {
    super.initState();
    _model = CertificateModel(
      log: Provider.of<Logger>(context, listen: false),
      certificateRepository:
          Provider.of<CertificateRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    _model.initData(widget.dataNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CertificateModel>.value(
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
            return Consumer<CertificateModel>(
              builder: (context, model, child) {
                final certificate = model.certificate;
                final certificateRequest = model.certificateRequest;
                final certificateCompleted = model.certificateCompleted;
                final certificateDenied = model.certificateDenied;

                return DefaultTabController(
                  length: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CertificateSearch(
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
                              "รายการขอ",
                              _model.certificateRequest.length,
                            ),
                            _buildTab(
                              "อนุมัติ",
                              _model.certificateCompleted.length,
                            ),
                            _buildTab(
                              "ปฏิเสธ",
                              model.certificateDenied.length,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildCertificateTab(certificate),
                              _buildCertificateTab(certificateRequest),
                              _buildCertificateTab(certificateCompleted),
                              _buildCertificateTab(certificateDenied),
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

  Widget _buildCertificateTab(List<Certificate> certificate) {
    if (certificate.isEmpty) {
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
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          ..._buildcertificateCard(certificate),
        ],
      ),
    );
  }

  List<Widget> _buildcertificateCard(
    List<Certificate> certificate,
  ) {
    final List<Widget> certificateCard = [];

    for (var i = 0; i < certificate.length; i++) {
      certificateCard.add(
        CertificateCard(
          certificate: certificate[i],
          onclickCertificate: (certificateId, status) {
            _oncertificateDetail(certificateId, status);
          },
        ),
      );

      if (i < certificate.length - 1) {
        certificateCard.add(const SizedBox(height: 16));
      }
    }

    return certificateCard;
  }

  Future<void> _oncertificateDetail(
    int certificateId,
    CertificateStatus? status,
  ) async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CertificateDetailScreen(
            certificateId: certificateId,
            status: status,
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
