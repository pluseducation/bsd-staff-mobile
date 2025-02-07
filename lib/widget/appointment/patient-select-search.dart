import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-selectl.dart';
import 'package:flutter/material.dart';

class PatientSelectSearch extends StatefulWidget {
  final Function(Search) onSearch;

  const PatientSelectSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<PatientSelectSearch> createState() => _PatientSelectSearchState();
}

class _PatientSelectSearchState extends State<PatientSelectSearch> {
  final TextEditingController _controller = TextEditingController();
  WorkFlowStatus? _selectedStatus;
  LevelType? _selectedOASStatus;
  DrugEvalResult? _selectedDrugStatus;
  TreatmentType? _selectedTreatmentStatus;
  SmivType? _selectedSmivStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText:
                          'ค้นหาจากชื่อ-นามสกุล, เลขบัตร/เลขแทน, เลขรอบบำบัด',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA0A6A9),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      filled: true,
                    ),
                    style: const TextStyle(
                      fontSize: FontSizes.small,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: MainColors.primary500,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "ตัวกรอง",
                            style: TextStyle(
                              color: MainColors.primary500,
                              fontSize: FontSizes.small,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "สถานะ",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 4),
            PatiaStatusSelectl(
              onSelected: (WorkFlowStatus? status) {
                setState(() {
                  _selectedStatus = status;
                });
              },
              initialSelectedStatus: _selectedStatus,
            ),
            const SizedBox(height: 4),
            const Text(
              "OAS",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 4),
            PatiaOASSelectl(
              onSelected: (LevelType? status) {
                setState(() {
                  _selectedOASStatus = status;
                });
              },
              initialSelectedStatus: _selectedOASStatus,
            ),
            const SizedBox(height: 4),
            const Text(
              "V2",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            DrugEvalResultSelectl(
              onSelected: (DrugEvalResult? status) {
                setState(() {
                  _selectedDrugStatus = status;
                });
              },
              initialSelectedStatus: _selectedDrugStatus,
            ),
            const SizedBox(height: 4),
            const Text(
              "ประเภท การบำบัดรักษาล่าสุด",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 4),
            TreatmentTypeSelectl(
              onSelected: (TreatmentType? status) {
                setState(() {
                  _selectedTreatmentStatus = status;
                });
              },
              initialSelectedStatus: _selectedTreatmentStatus,
            ),
            const SizedBox(height: 4),
            const Text(
              "สถานะเพิ่มเติม",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 4),
            SmivTypeSelectl(
              onSelected: (SmivType? status) {
                setState(() {
                  _selectedSmivStatus = status;
                });
              },
              initialSelectedStatus: _selectedSmivStatus,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: const BorderSide(
                    color: Color(0xFFDFE1E6),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "ยกเลิก",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: FontSizes.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final search = Search(
                    searchVal: _controller.text,
                    workFlowStatus:
                        _selectedStatus != null ? [_selectedStatus!] : [],
                    levelType:
                        _selectedOASStatus != null ? [_selectedOASStatus!] : [],
                    drugEvalResult: _selectedDrugStatus != null
                        ? [_selectedDrugStatus!]
                        : [],
                    treatmentType: _selectedTreatmentStatus != null
                        ? [_selectedTreatmentStatus!]
                        : [],
                    smivType: _selectedSmivStatus != null
                        ? [_selectedSmivStatus!]
                        : [],
                    page: 0,
                    totalPages: 0,
                    totalElements: 0,
                    size: 10,
                  );
                  widget.onSearch(search);
                  // Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColors.primary500,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "ตกลง",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
