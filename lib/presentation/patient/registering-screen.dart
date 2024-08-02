import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';

class Registering extends StatefulWidget {
  const Registering({super.key});

  @override
  State<Registering> createState() => _RegisteringtState();
}

class _RegisteringtState extends State<Registering> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            child: BaseLayoutPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/profile2.png",
                        width: 100,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "สมหญิง ประกอบ",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0DDBF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "คัดกรอง",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFB76E00),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 90,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0DDBF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "กึ่งเร่งด่วน",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFB76E00),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Color(0xFFF1F1F1),
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ข้อมูลส่วนบุคคล",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "วันเดือนปีเกิด",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "02/02/1002",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "เพศ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "หญิง",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "สัญชาติ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(
                        width: 74,
                      ),
                      Text(
                        "ไทย",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "ศาสนา",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF848484),
                        ),
                      ),
                      SizedBox(
                        width: 82,
                      ),
                      Text(
                        "พุทธ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ที่อยู่",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ที่อยู่ตามทะเบียนราษฎร์",
                    style: TextStyle(fontSize: 18, color: Color(0xFF434343)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "77/14 รัชดา 23 แยก 7 กรุงเทพมหานคร 10900",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "ที่อยู่ปัจจุบัน",
                    style: TextStyle(fontSize: 18, color: Color(0xFF434343)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "77/14 รัชดา 23 แยก 7 กรุงเทพมหานคร 10900",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ข้อมูลผู้ปกครอง",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "นาย ทิพย ประกอบ (บิดา)",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "02-222-2222",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "การเข้าสู่ระบบมาตรการบำบัด",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "77/14 รัชดา 23 แยก 7  กรุงเทพมหานคร 10900",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
