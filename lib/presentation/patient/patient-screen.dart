import 'dart:async';

import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-model.dart';
import 'package:bst_staff_mobile/presentation/patient/workflow-screen.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PaginationController {
  int currentPage = 0;
  final int itemsPerPage;
  int totalItems;
  String name = "";
  final _totalItemController = StreamController<int>();
  final _nameController = StreamController<String>();
  final _pageController = StreamController<int>();
  final _pageSearchController = StreamController<int>();
  final _totalSearchItemController = StreamController<int>();

  Stream<int> get totalItemStream => _totalItemController.stream;
  Stream<String> get nameStream => _nameController.stream;
  Stream<int> get pageStream => _pageController.stream;
  Stream<int> get pageSearchStream => _pageSearchController.stream;
  Stream<int> get totalSearchItemStream => _totalSearchItemController.stream;

  PaginationController({required this.itemsPerPage, required this.totalItems});
  int get totalPages => (totalItems / itemsPerPage).ceil();

  void setName(String value) {
    name = value;
    currentPage = 0;
    _nameController.add(value);
    _pageSearchController.add(0);
  }

  void setCurrentPage(int value) {
    currentPage = value;

    _pageController.add(value);
    _pageSearchController.add(value);
  }

  void nextPage() {
    if (currentPage < totalPages - 1) {
      currentPage++;
    }

    _pageController.add(currentPage);
    _pageSearchController.add(currentPage);
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }

    _pageController.add(currentPage);
    _pageSearchController.add(currentPage);
  }

  void setTotalItem(int value) {
    totalItems = value;
    _totalSearchItemController.add(value);
    _totalItemController.add(value);
  }
}

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  late PaginationController _paginationController;

  @override
  void initState() {
    super.initState();
    _paginationController = PaginationController(
      itemsPerPage: Constant.size,
      totalItems: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: MainColors.primary500,
        title: PatientTitleScreen(
          paginationController: _paginationController,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: MainColors.primary500,
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Container(
                            color: Colors.white,
                            child: SearchPatient(
                              paginationController: _paginationController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: BaseLayoutScrollView(
                            child: Column(
                              children: [
                                PatientList(
                                  paginationController: _paginationController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PaginationControls(
                    paginationController: _paginationController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientTitleScreen extends StatefulWidget {
  final PaginationController paginationController;

  const PatientTitleScreen({
    super.key,
    required this.paginationController,
  });

  @override
  State<PatientTitleScreen> createState() => _PatientTitleScreenState();
}

class _PatientTitleScreenState extends State<PatientTitleScreen> {
  int totalItem = 0;

  @override
  void initState() {
    super.initState();

    widget.paginationController.totalItemStream.listen((value) {
      setState(() {
        totalItem = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "ผู้ป่วย",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "($totalItem)",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SearchPatient extends StatefulWidget {
  final PaginationController paginationController;

  const SearchPatient({super.key, required this.paginationController});

  @override
  _SearchPatientState createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    widget.paginationController.setName(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _searchController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "ค้นหาจากชื่อ รอบบำบัด",
          ),
          onChanged: _onSearchChanged,
        ),
      ],
    );
  }
}

class PaginationControls extends StatefulWidget {
  final PaginationController paginationController;

  const PaginationControls({
    super.key,
    required this.paginationController,
  });

  @override
  _PaginationControlsState createState() => _PaginationControlsState();
}

class _PaginationControlsState extends State<PaginationControls> {
  int totalItem = 0;
  int totalPage = 0;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.paginationController.totalSearchItemStream.listen((value) {
      setState(() {
        totalItem = value;
        totalPage = widget.paginationController.totalPages;
      });
    });

    widget.paginationController.pageSearchStream.listen((value) {
      setState(() {
        currentPage = value;
      });
    });

    totalItem = widget.paginationController.totalItems;
    totalPage = widget.paginationController.totalPages;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageButtons = [];

    if (totalPage <= 4) {
      for (int i = 0; i < totalPage; i++) {
        pageButtons.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
              width: 35,
              height: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: i == currentPage
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: i == currentPage
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                    ),
                  ),
                ),
                onPressed: () {
                  widget.paginationController.setCurrentPage(i);
                },
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color: i == currentPage ? Colors.white : Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    } else {
      if (currentPage > 0) {
        if (currentPage > 1) {
          pageButtons.add(
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Text('...'),
            ),
          );
        }
      }

      final int start = (currentPage - 1).clamp(0, totalPage - 4);
      final int end = (currentPage + 1).clamp(4, totalPage - 1);

      for (int i = start; i <= end; i++) {
        pageButtons.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
              width: 35,
              height: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: i == currentPage
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: i == currentPage
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                    ),
                  ),
                ),
                onPressed: () => widget.paginationController.setCurrentPage(i),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color: i == currentPage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }

      if (currentPage < totalPage - 2) {
        pageButtons.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: Text('...'),
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF808080),
            size: 20,
          ),
          onPressed: widget.paginationController.previousPage,
        ),
        ...pageButtons,
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF808080),
            size: 20,
          ),
          onPressed: widget.paginationController.nextPage,
        ),
      ],
    );
  }
}

class PatientList extends StatefulWidget {
  final PaginationController paginationController;

  const PatientList({
    super.key,
    required this.paginationController,
  });

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  late PatientModel _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _model = PatientModel(
      log: Provider.of<Logger>(super.context, listen: false),
      patientRepository:
          Provider.of<PatientRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    widget.paginationController.nameStream.listen((name) {
      _model.name = name;
      _model.page = 0;
      onChange();
    });

    widget.paginationController.pageStream.listen((page) {
      _model.page = page;
      onChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onChange() async {
    await _model.loadData();
    final totalItem = _model.patients.totalElements;
    widget.paginationController.setTotalItem(totalItem);
    setState(() {});
  }

  Future<PatientAll> onLoad() async {
    await _model.loadData();
    final totalItem = _model.patients.totalElements;
    widget.paginationController.setTotalItem(totalItem);
    return _model.patients;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<PatientAll>(
          future: onLoad(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('ไม่มีข้อมูล'));
            } else {
              final PatientAll patients = snapshot.data!;
              return Column(
                children: patients.content.map((patient) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkflowScreen(
                                patientId: patient.patientId,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: MainColors.background,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/profile2.png", //patient.imagePath,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      15,
                                      3,
                                      0,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          patient.fullName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          patient.nationalId,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          patient.cycle,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              patientStatusWidget(patient.status),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFFF1F1F1),
                        thickness: 0.8,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildStatusContainer(String status) {
    return SizedBox(
      width: 90,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _getColorForStatus(status),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                _getTextForStatus(status),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _getTextColorForStatus(status),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForStatus(String status) {
    switch (status) {
      case "คัดกรอง":
        return const Color.fromARGB(255, 240, 221, 191);
      default:
        return const Color(0xFFF9F9F9);
    }
  }

  String _getTextForStatus(String status) {
    switch (status) {
      case "ลงทะเบียน":
        return "ลงทะเบียน";
      case "คัดกรอง":
        return "คัดกรอง";
      case "รายการขอ":
        return "รายการขอ";
      default:
        return "";
    }
  }

  Color _getTextColorForStatus(String status) {
    return status == "คัดกรอง" ? const Color(0xFFB76E00) : Colors.black;
  }
}
