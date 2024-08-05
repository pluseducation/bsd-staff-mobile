import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            child: BaseLayoutPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "บำบัด • การใช้ยาเสพติด",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       //
                  //       "สถานภาพการเสพติดขณะบำบัด",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //     Text(
                  //       "โสด",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "การศึกษา",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 45,
                  //     ),
                  //     Text(
                  //       "ประถมการศึกษา",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "อาชีพ",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 74,
                  //     ),
                  //     Text(
                  //       "หมอ",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "รายได้",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 69,
                  //     ),
                  //     Text(
                  //       "100,000",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "อาศัยอยู่กับ (ในช่วง 30 วันที่ผ่านมา)",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "เพื่อน",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "อยู่คนเดียว, มารดา",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  //   overflow: TextOverflow.visible,
                  //   // softWrap: true,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "ความสัมพันธ์ระหว่างบิดามารดา",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Color(0xFF848484),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         "อยู่ด้วยกัน",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Text(
                  //   "คัดกรอง • การใช้ยาเสพติด",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Text(
                  //   "วันที่เข้ารับการคัดกรอง",
                  //   style: TextStyle(fontSize: 18, color: Color(0xFF434343)),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "วันนี้ 4 มีนาคม 2566",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "สถานะความเป็นสมาชิก ToBeNumber ONE (ใครติดยายกมือขึ้น)",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     // color: Color(0xFF434343),
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "ใช่",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "การใช้ยาเสพติด (รูปแบบการเสพ)",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "ผสม",
                  //   style: TextStyle(fontSize: 18, color: Color(0xFF434343)),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "ยาเสพติดที่ใช้",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "โคเคน",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     color: Color(0xFF434343),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
