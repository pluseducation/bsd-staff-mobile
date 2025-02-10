import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class PatientSearch extends StatefulWidget {
  final Function() onClickFilter;
  final Function(String) onValueChange;
  final bool isFilter;
  final TextEditingController controller;

  const PatientSearch({
    super.key,
    required this.onClickFilter,
    required this.onValueChange,
    required this.controller,
    required this.isFilter,
  });

  @override
  _PatientSearchState createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => widget.onValueChange(value),
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ค้นหาจากชื่อ-นามสกุล, เลขบัตร/เลขแทน, เลขรอบบำบัด',
                  hintStyle: const TextStyle(
                    fontSize: FontSizes.small,
                    color: MainColors.text,
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
                  onTap: widget.onClickFilter,
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: widget.isFilter
                            ? MainColors.primary500
                            : MainColors.text,
                      ),
                      Text(
                        "ตัวกรอง",
                        style: TextStyle(
                          fontSize: FontSizes.small,
                          color: widget.isFilter
                              ? MainColors.primary500
                              : MainColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
