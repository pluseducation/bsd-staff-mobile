import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class AssistanceSearch extends StatefulWidget {
  final Function(String) onValueChange;
  // final TextEditingController controller;

  const AssistanceSearch({
    super.key,
    required this.onValueChange,
    // required this.controller,
  });

  @override
  _AssistanceSearchState createState() => _AssistanceSearchState();
}

class _AssistanceSearchState extends State<AssistanceSearch> {
  TextEditingController valueController = TextEditingController();
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
                controller: valueController,
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
          ],
        ),
      ],
    );
  }
}
