import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CertificateSearchProvider extends ChangeNotifier {
  String _searchQuery = '';
  List<Certificate> _allCertificate = [];
  List<Certificate> _filteredCertificate = [];

  List<Certificate> get filterCertificate => _filteredCertificate;

  void setBooks(List<Certificate> name) {
    _allCertificate = name;
    _filteredCertificate = name;
    notifyListeners();
  }

  void setCertificate(List<Certificate> name) {
    _allCertificate = name;
    _filteredCertificate = _allCertificate;
    notifyListeners();
  }

  void updateSearchQuery(String name) {
    _searchQuery = name;
//ส่งค่า name กลับไปยัง  findCertificateAll
    notifyListeners();
  }
}

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late final CertificateModel model;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    model = CertificateModel(
      log: Provider.of<Logger>(context, listen: false),
      certificateRepository:
          Provider.of<CertificateRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    onLoad();
  }

  Future<void> _initData() async {
    await model.loadDatas();
    Provider.of<CertificateSearchProvider>(context, listen: false)
        .setBooks(_model.);
  }

  Future<void> onLoad() async {
    await model.loadDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: MainColors.primary500,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ใบรับรอง (1 รายการ)",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const BaseLayout(
                maxWidth: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CertificateSearch(),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CertificateTab(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CertificateSearch extends StatefulWidget {
  const CertificateSearch({
    super.key,
  });
  @override
  State<CertificateSearch> createState() => _CertificateSearchState();
}

class _CertificateSearchState extends State<CertificateSearch> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchController,
          onChanged: (value) {
            Provider.of<CertificateSearchProvider>(context, listen: false)
                .updateSearchQuery(value);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "ค้นหาจากชื่อ รอบบำบัด",
          ),
          // onChanged: _onSearchChanged,
        ),
      ],
    );
  }
}

class CertificateTab extends StatefulWidget {
  const CertificateTab({super.key});

  @override
  State<CertificateTab> createState() => _CertificateTabState();
}

class _CertificateTabState extends State<CertificateTab>
    with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CertificateSearchProvider>(
      builder: (BuildContext context, CertificateSearchProvider value, Widget? child) {  },
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            dividerColor: const Color(0xFFf1f1f1),
            indicatorColor: MainColors.primary700,
            tabs: [
              const Tab(text: 'ทั้งหมด'),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('รายการขอ'),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Text('3', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
              const Tab(text: 'จัดการ Sign off'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Center(child: CertificateListAll()),
                Center(child: CertificateRequests()),
                Center(child: CertificateCompletes()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Tab CertificateListAll

class CertificateListAll extends StatefulWidget {
  const CertificateListAll({super.key});

  @override
  State<CertificateListAll> createState() => _CertificateListAllState();
}

class _CertificateListAllState extends State<CertificateListAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('มาลี ใจดี'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('1122344567803'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('วันขอ: 20/03/2567 (2 วันที่แล้ว)'),
                  ],
                ),
              ),
              certificateStatusWidget("1"),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFDEE2E4),
          thickness: 0.8,
        ),
      ],
    );
  }
}

// --Tab CertificateRequests
class CertificateRequests extends StatefulWidget {
  const CertificateRequests({super.key});

  @override
  State<CertificateRequests> createState() => _CertificateRequestsState();
}

class _CertificateRequestsState extends State<CertificateRequests> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('มาลี ใจดี'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('1100466787532'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('วันขอ: 20/03/2567 (2 วันที่แล้ว)'),
                  ],
                ),
              ),
              certificateStatusWidget("1"),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFDEE2E4),
          thickness: 0.8,
        ),
      ],
    );
  }
}

// -- Tab CertificateCompletes
class CertificateCompletes extends StatefulWidget {
  const CertificateCompletes({super.key});

  @override
  State<CertificateCompletes> createState() => _CertificateCompletesState();
}

class _CertificateCompletesState extends State<CertificateCompletes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('มาลี ใจดี'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('1288766589540'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('วันขอ: 20/03/2567 (2 วันที่แล้ว)'),
                  ],
                ),
              ),
              certificateStatusWidget("1"),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFDEE2E4),
          thickness: 0.8,
        ),
      ],
    );
  }
}
