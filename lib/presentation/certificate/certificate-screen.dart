import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/layout/home-layout.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CertificateSearchProvider extends ChangeNotifier {
  final CertificateModel _model;
  Certificate certificate =
      const Certificate(alls: [], requests: [], completes: []);
  bool isLoading = false;
  String? errorMessage;

  CertificateSearchProvider(this._model);

  Future<void> loadData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      certificate = await _model.findByName("");
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading = false;
        notifyListeners();
      });
    }
  }

  Future<void> findByName(String name) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      certificate = await _model.findByName(name);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading = false;
        notifyListeners();
      });
    }
  }
}

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final model = CertificateModel(
      log: Provider.of<Logger>(context, listen: false),
      certificateRepository:
          Provider.of<CertificateRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    return ChangeNotifierProvider(
      create: (_) => CertificateSearchProvider(model),
      child: const CertificateScreenGroup(),
    );
  }
}

class CertificateScreenGroup extends StatefulWidget {
  const CertificateScreenGroup({super.key});

  @override
  _CertificateScreenGroupState createState() => _CertificateScreenGroupState();
}

class _CertificateScreenGroupState extends State<CertificateScreenGroup> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CertificateSearchProvider>(
      builder: (context, searchProvider, child) {
        return Scaffold(
          backgroundColor: MainColors.primary500,
          // appBar: BaseAppbarCertificate(
          //   certificateCount: searchProvider.certificate.alls.length,
          // ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MainColors.primary500,
                  Colors.white,
                ],
                stops: [-0.017, 1.2193],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(280 * (3.14159 / 50)),
              ),
              color: Colors.white12,
            ),
            child: Column(
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
                    child: SingleChildScrollView(
                      child: Center(
                        child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(maxWidth: double.infinity),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final provider =
        Provider.of<CertificateSearchProvider>(context, listen: false);
    final tabState = context.findAncestorStateOfType<_CertificateTabState>();

    if (searchController.text.isEmpty) {
      provider.loadData();
    } else {
      provider.findByName(searchController.text);
    }

    tabState?.switchToFirstTab();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "ค้นหาจากชื่อ รอบบำบัด",
          ),
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
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CertificateSearchProvider>(context, listen: false).loadData();
    });
  }

  void switchToFirstTab() {
    tabController.animateTo(0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CertificateSearchProvider>(
      builder: (context, searchProvider, child) {
        if (searchProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (searchProvider.errorMessage != null) {
          return Center(child: Text('Error: ${searchProvider.errorMessage}'));
        } else if (searchProvider.certificate.alls.isEmpty) {
          return const Center(child: Text('ไม่พบข้อมูล'));
        } else {
          return Column(
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
                        // Container(
                        //   padding: const EdgeInsets.all(6),
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey[300],
                        //     shape: BoxShape.circle,
                        //   ),
                        //   child: Text(
                        //     searchProvider.certificate.requests.length
                        //         .toString(),
                        //     style: const TextStyle(fontSize: 12),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Tab(text: 'ออกใบรับรอง'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    CertificateListAll(
                      certificates: searchProvider.certificate.alls,
                    ),
                    CertificateRequests(
                      certificates: searchProvider.certificate.requests,
                    ),
                    CertificateCompletes(
                      certificates: searchProvider.certificate.completes,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class CertificateListAll extends StatelessWidget {
  final List<CertificateRequest> certificates;

  const CertificateListAll({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: certificates.length,
      itemBuilder: (context, index) {
        final certificate = certificates[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(certificate.fullName),
                        const SizedBox(height: 10),
                        Text(certificate.nationalId),
                        const SizedBox(height: 10),
                        Text('วันขอ: ${certificate.requestedDateText}'),
                      ],
                    ),
                  ),
                  certificateStatusWidget(certificate.status),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFDEE2E4),
              thickness: 0.8,
            ),
          ],
        );
      },
    );
  }
}

class CertificateRequests extends StatelessWidget {
  final List<CertificateRequest> certificates;

  const CertificateRequests({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: certificates.length,
      itemBuilder: (context, index) {
        final certificate = certificates[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(certificate.fullName),
                        const SizedBox(height: 10),
                        Text(certificate.nationalId),
                        const SizedBox(height: 10),
                        Text('วันขอ: ${certificate.requestedDateText}'),
                      ],
                    ),
                  ),
                  certificateStatusWidget(certificate.status),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFDEE2E4),
              thickness: 0.8,
            ),
          ],
        );
      },
    );
  }
}

class CertificateCompletes extends StatelessWidget {
  final List<CertificateRequest> certificates;

  const CertificateCompletes({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: certificates.length,
      itemBuilder: (context, index) {
        final certificate = certificates[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(certificate.fullName),
                        const SizedBox(height: 10),
                        Text(certificate.nationalId),
                        const SizedBox(height: 10),
                        Text('วันขอ: ${certificate.requestedDateText}'),
                      ],
                    ),
                  ),
                  certificateStatusWidget(certificate.status),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFDEE2E4),
              thickness: 0.8,
            ),
          ],
        );
      },
    );
  }
}
