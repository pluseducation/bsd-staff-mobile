import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';

class ScreeningScreen extends StatefulWidget {
  const ScreeningScreen({super.key});

  @override
  State<ScreeningScreen> createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
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
                    "คัดกรอง • ข้อมูลส่วนบุคคลเพิ่มเติม",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "สถานภาพการเสพติดขณะบำบัด",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "โสด",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "การศึกษา",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(width: 45),
                      Text(
                        "ประถมการศึกษา",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "อาชีพ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(width: 74),
                      Text(
                        "หมอ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "รายได้",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(width: 69),
                      Text(
                        "100,000",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "อาศัยอยู่กับ (ในช่วง 30 วันที่ผ่านมา)",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "เพื่อน",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "อยู่คนเดียว, มารดา",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "ความสัมพันธ์ระหว่างบิดามารดา",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "อยู่ด้วยกัน",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  // ------------------------------
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseLayoutPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "คัดกรอง • การใช้ยาเสพติด",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "วันที่เข้ารับการคัดกรอง",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF434343)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "วันนี้ 4 มีนาคม 2566",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "สถานะความเป็นสมาชิก ToBeNumber ONE (ใครติดยายกมือขึ้น)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ใช่",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "การใช้ยาเสพติด (รูปแบบการเสพ)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ผสม",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF434343)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ยาเสพติดที่ใช้",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "โคเคน",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF434343),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "คัดกรอง • ปัญหาสุขภาพทางจิต",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFFFF0E5),
                    child: BaseLayoutPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "สรุปผล",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "ไม่มีอาการ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF009951),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: BaseLayoutPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "แบบประเมินพฤติกรรมก้าวร้าวรุนแรง",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "คุณใช้บ่อยเพียงใด?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ไม่เคย",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF434343),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "คุณมีความต้องการ หรือมีความรู้สึกอยากใช้ ยาบ้า จนทนไม่ได้บ่อยเพียงใด??",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "เพียง 1-2 ครั้ง",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF434343),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ญาติ เพื่อน หรือคนที่รู้จักเคยว่ากล่าวตักเตือนวิพากษ์วิจารณ์ จับผิด หรือแสดงท่าทีสงสัยว่าคุณเกี่ยวข้องกับการใช้ ยาบ้า หรือไม่",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "เคยแต่ก่อน 3 เดือนที่ผ่านมา",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF434343),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "คุณเคยลดหรือหยุดใช้ ยาบ้า แต่ไม่ประสบความสำเร็จ หรือไม่",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ไม่เคย",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF434343),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFFFF6F6),
                    child: BaseLayoutPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ผลการคัดกรอง",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "9",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ระดับผลกระทบจากการใช้",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ปานกลาง",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ผลการคัดกรอง",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "ผู้เสพ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFBD59),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseLayoutPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "คุณเคยใช้สารเสพติดชนิดฉีดหรือไม่",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "เคย",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ภายใน 3 เดือนที่ผ่านมา คุณใช้บ่อยเพียงใด",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1 ครั้งต่อสัปดาห์ หรือ น้อยกกว่า 3 วันติดต่อกัน",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ประวัติรักษาโรคสุขภาพจิต",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ไม่มี",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ประวัติคดีอาญา",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ไม่มี",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "คนเร่ร่อน ไร้ที่พักพิง",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ไม่ใช่",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ผู้พิการ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "พิการทางจิต",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
