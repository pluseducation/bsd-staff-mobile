import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ค้นหาจากชื่อ-นามสกุล, เลขบัตร/เลขแทน, เลขรอบบำบัด',
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
            const Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFFA0A6A9),
            ),
            const SizedBox(width: 4),
            const Text(
              "ตัวกรอง",
              style: TextStyle(
                color: Color(0xFFA0A6A9),
                fontSize: FontSizes.small,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
