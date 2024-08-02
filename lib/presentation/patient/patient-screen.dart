import 'dart:async';

import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/patient-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  late PaginationController _paginationController;
  List<PatientData> _filteredPatientData = [];

  @override
  void initState() {
    super.initState();
    _paginationController = PaginationController(
      itemsPerPage: 7,
      totalItems: 0,
    );
  }

  void _searchPatient(String query) {
    print('query =>>>>: $query');

    setState(() {
      _paginationController.currentPage = 0;
    });
  }
  // void _searchPatient(String query) {
  //   final filteredData = _filteredPatientData
  //       .where((patient) =>
  //           patient.name.contains(query) || patient.therapy.contains(query),),
  //       .toList();

  //   setState(() {
  //     _filteredPatientData = filteredData;
  //     _paginationController.totalItems = filteredData.length;
  //     setState(() {
  //       _paginationController.currentPage = 0;
  //     });
  //   });
  // }

  void _onPageChanged(int page) {
    setState(() {
      _paginationController.setCurrentPage(page);
    });
  }

  void _onPreviousPage() {
    setState(() {
      _paginationController.previousPage();
    });
  }

  void _onNextPage() {
    setState(() {
      _paginationController.nextPage();
    });
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
              "ผู้ป่วย",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              "(2,000)",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                                  patients: _filteredPatientData,
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
                    totalPages: _paginationController.totalPages,
                    currentPage: _paginationController.currentPage,
                    onPageChanged: _onPageChanged,
                    onPreviousPage: _onPreviousPage,
                    onNextPage: _onNextPage,
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

class PaginationController {
  int currentPage = 0;
  final int itemsPerPage;
  int totalItems;
  String name = "";
  final _nameController = StreamController<String>();
  final _pageController = StreamController<int>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<int> get pageStream => _pageController.stream;

  PaginationController({required this.itemsPerPage, required this.totalItems});
  int get totalPages => (totalItems / itemsPerPage).ceil();

  void setName(String value) {
    name = value;
    _nameController.add(value);
  }

  void setCurrentPage(int value) {
    currentPage = value;

    _pageController.add(value);
  }

  void nextPage() {
    if (currentPage < totalPages - 1) {
      currentPage++;
    }

    _pageController.add(currentPage);
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }

    _pageController.add(currentPage);
  }

  // ignore: use_setters_to_change_properties
  void setTotalItem(int value) {
    totalItems = value;
  }
}

class PaginationControls extends StatefulWidget {
  final int totalPages;
  final int currentPage;
  final void Function(int) onPageChanged;
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  const PaginationControls({
    Key? key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
    required this.onPreviousPage,
    required this.onNextPage,
  }) : super(key: key);

  @override
  _PaginationControlsState createState() => _PaginationControlsState();
}

class _PaginationControlsState extends State<PaginationControls> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pageButtons = [];

    if (widget.totalPages <= 4) {
      for (int i = 0; i < widget.totalPages; i++) {
        pageButtons.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
              width: 35,
              height: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: i == widget.currentPage
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: i == widget.currentPage
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                    ),
                  ),
                ),
                onPressed: () => widget.onPageChanged(i),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color:
                          i == widget.currentPage ? Colors.white : Colors.black,
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
      if (widget.currentPage > 0) {
        if (widget.currentPage > 1) {
          pageButtons.add(
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Text('...'),
            ),
          );
        }
      }

      final int start =
          (widget.currentPage - 1).clamp(0, widget.totalPages - 4);
      final int end = (widget.currentPage + 1).clamp(4, widget.totalPages - 1);

      for (int i = start; i <= end; i++) {
        pageButtons.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
              width: 35,
              height: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: i == widget.currentPage
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: i == widget.currentPage
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                    ),
                  ),
                ),
                onPressed: () => widget.onPageChanged(i),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color:
                          i == widget.currentPage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }

      if (widget.currentPage < widget.totalPages - 2) {
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
          onPressed: widget.onPreviousPage,
        ),
        ...pageButtons,
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF808080),
            size: 20,
          ),
          onPressed: widget.onNextPage,
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

class PatientList extends StatefulWidget {
  final List<PatientData> patients;
  final PaginationController paginationController;

  const PatientList({
    super.key,
    required this.patients,
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

    _model.test();

    widget.paginationController.nameStream.listen((name) {
      _model.name = name;
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

  Future<List<PatientData>> onLoad() async {
    final patiens = await _model.loadData();
    widget.paginationController.setTotalItem(patiens.length);
    return patiens;
  }

  Future<void> onChange() async {
    await onLoad();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<PatientData>>(
          future: onLoad(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No patients available'));
            } else {
              final List<PatientData> patients = snapshot.data!;
              return Column(
                children: patients.map((patient) {
                  return SizedBox(
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
                                    patient.imagePath,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 3, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patient.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    patient.cardnumber,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    patient.therapy,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _buildStatusContainer(patient.status),
                      ],
                    ),
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
