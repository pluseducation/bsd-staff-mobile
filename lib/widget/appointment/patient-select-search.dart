import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appointment/patient-selectl.dart';
import 'package:flutter/material.dart';

class PatientSelectSearch extends StatefulWidget {
  const PatientSelectSearch({super.key});

  @override
  State<PatientSelectSearch> createState() => _PatientSelectSearchState();
}

class _PatientSelectSearchState extends State<PatientSelectSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "สถานะ",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 4),
            PatiaStatusSelectl(
              onSelected: (WorkFlowStatus? status) {
                print("สถานะที่เลือก:==>>> $status");
              },
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
                print("OAS ที่เลือก:==>>> $status");
              },
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
                print("DrugEvalResult ที่เลือก:==>>> $status");
              },
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
                print("TreatmentType ที่เลือก:==>>> $status");
              },
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
                print("SmivType ที่เลือก:==>>> $status");
              },
            ),
            // const Spacer(),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  print("ยกเลิก");
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
                  print("ตกลง");
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
