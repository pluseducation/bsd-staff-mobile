import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

const Map<String, String> options = {
  'NAME': "ชื่อ-นามสกุล",
  'NATIONAL_ID': "เลขบัตรประชาชน / เลขแทน",
  'CYCLE': "เลขรอบบำบัด",
};

class PatientHistorySearch extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController nationalIdController;
  final TextEditingController cycleController;
  final Function(String) onValueChange;

  const PatientHistorySearch({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.nationalIdController,
    required this.cycleController,
    required this.onValueChange,
  });

  @override
  _PatientHistorySearch createState() => _PatientHistorySearch();
}

class _PatientHistorySearch extends State<PatientHistorySearch> {
  TextEditingController valueController = TextEditingController();
  String _selectedOption = 'NAME';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: options.keys.map<DropdownMenuItem<String>>((String key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(options[key]!),
            );
          }).toList(),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: MainColors.divider,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (_selectedOption == options.keys.elementAt(0)) ...[
              Expanded(
                child: TextField(
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อ',
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
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontSize: FontSizes.small,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: widget.surnameController,
                  decoration: InputDecoration(
                    hintText: 'นามสกุล',
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
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontSize: FontSizes.small,
                  ),
                ),
              ),
            ] else if (_selectedOption == options.keys.elementAt(1)) ...[
              Expanded(
                child: TextField(
                  controller: widget.nationalIdController,
                  decoration: InputDecoration(
                    hintText: 'เลขบัตรประชาชน / เลขแทน',
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
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontSize: FontSizes.small,
                  ),
                ),
              ),
            ] else if (_selectedOption == options.keys.elementAt(2)) ...[
              Expanded(
                child: TextField(
                  controller: widget.cycleController,
                  decoration: InputDecoration(
                    hintText: 'เลขรอบบำบัด',
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
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontSize: FontSizes.small,
                  ),
                ),
              ),
            ],
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
              onPressed: () {
                widget.onValueChange(_selectedOption);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MainColors.primary500,
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("ค้นหา"),
            ),
          ],
        ),
      ],
    );
  }
}
