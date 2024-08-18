import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

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
              "ใบรับรอง",
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
                    )
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
  const CertificateSearch({super.key});

  @override
  State<CertificateSearch> createState() => _CertificateSearchState();
}

class _CertificateSearchState extends State<CertificateSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // controller: _searchController,
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
    return Column(
      children: [
        TabBar(
          controller: tabController,
          dividerColor: const Color(0xFFf1f1f1),
          indicatorColor: MainColors.primary700,
          tabs: [
            const Tab(text: 'ทั้งหมด'), // First tab with only text
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
            ), // Second tab with text and badge
            const Tab(text: 'จัดการ Sign off'), // Third tab with only text
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              Center(child: CertificateList()),
              Center(child: CertificateList()),
              Center(child: CertificateList()),
            ],
          ),
        ),
      ],
    );
  }
}

class CertificateList extends StatefulWidget {
  const CertificateList({super.key});

  @override
  State<CertificateList> createState() => _CertificateListState();
}

class _CertificateListState extends State<CertificateList> {
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
                    Text('HN99231'),
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
                    Text('HN99231'),
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
      ],
    );
  }
}
