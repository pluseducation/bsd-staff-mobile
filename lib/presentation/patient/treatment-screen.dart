import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/workflow-model.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class TreatmentScreen extends StatefulWidget {
  final int patientId;
  const TreatmentScreen({
    super.key,
    required this.patientId,
  });

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  late final WorkflowdModel _model;

  @override
  void initState() {
    super.initState();
    _model = WorkflowdModel(
      log: Provider.of<Logger>(super.context, listen: false),
      workflowRepository:
          Provider.of<WorkflowRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Treatment>(
      future: _model.findTreatment(widget.patientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('ไม่พบข้อมูล'));
        } else {
          final data = snapshot.data!;
          if (data.treatmentDate.isEmpty) {
            return renderEmptyData();
          }
          return renderTreatment(data);
        }
      },
    );
  }

  Widget renderTreatment(Treatment data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "บำบัด • การใช้ยาเสพติด",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "วันที่เข้ารับการบำบัด",
              style: TextStyle(color: Color(0xFF434343)),
            ),
            const SizedBox(height: 16),
            Text(
              data.treatmentDate,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "ประเมินพฤติกรรมก้าวร้าว (OAS)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            mentalEvalLevelResultWidget(data.mentalEvalLevel),
            const SizedBox(height: 16),
            const Text(
              "แบบประเมินพฤติกรรมการใช้ยาเสพติด (V2)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            drugEvalScrollResultWidget(
              data.drugEvalScore,
              data.levelOfAddicted,
              data.treatmentResult,
            ),
            const SizedBox(height: 16),
            const Text(
              "สรุปผล",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "วันที่ประเมินผล",
              style: TextStyle(color: Color(0xFF434343)),
            ),
            const SizedBox(height: 16),
            Text(
              data.treatmentDate,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "การประเมินผลการบำบัดรักษา / ฟื้นฟูสมรรถภาพ",
              style: TextStyle(color: Color(0xFF434343)),
            ),
            const SizedBox(height: 16),
            Text(
              data.evaluationResult,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "ผลการรักษาอาการสุขภาพจิต",
              style: TextStyle(color: Color(0xFF434343)),
            ),
            const SizedBox(height: 16),
            Text(
              data.mentalTreatmentResult,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "ผลการรักษาอาการสุขภาพทางกาย",
              style: TextStyle(color: Color(0xFF434343)),
            ),
            const SizedBox(height: 16),
            Text(
              data.physicalTreatmentResult,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderEmptyData() {
    return const Center(
      child: Text('ไม่พบข้อมูลการบำบัด'),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         width: double.infinity,
  //         child: Card(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               BaseLayoutPadding(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       "บำบัด • การใช้ยาเสพติด",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 15),
  //                     const Text(
  //                       "วันที่ลงทะเบียนการบำบัด",
  //                       style:
  //                           TextStyle(fontSize: 18, color: Color(0xFF434343)),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "05 สิงหาคม 2024",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "สาเหตุสำคัญที่ใช้ยาเสพติดครั้งแรก",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     Text(
  //                       _treatmentData.isNotEmpty
  //                           ? _treatmentData.join(', ')
  //                           : '',
  //                       style: const TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "ใช้ยาเสพติดครั้งแรก",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "อายุที่ใช้ยาเสพติดครั้งแรก",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "20",
  //                       style:
  //                           TextStyle(fontSize: 18, color: Color(0xFF434343)),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "ยาเสพติดที่ใช้",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "ยาอี",
  //                       style:
  //                           TextStyle(fontSize: 18, color: Color(0xFF434343)),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "ยาเสพติดที่ใช้",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "โคเคน",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         color: Color(0xFF434343),
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "การใช้ยาเสพติดในปัจจุบัน",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     Text(
  //                       _medicineData.isNotEmpty
  //                           ? _medicineData.join(', ')
  //                           : 'No data',
  //                       style: const TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     const Text(
  //                       "ระยะเวลาที่ใช้",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     // ------
  //                     const Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Column(
  //                           children: [
  //                             Text(
  //                               "ปี",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             SizedBox(height: 10),
  //                             Text(
  //                               "4",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 color: Color(0xFF434343),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Column(
  //                           children: [
  //                             Text(
  //                               "เดือน",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             SizedBox(height: 10),
  //                             Text(
  //                               "5",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 color: Color(0xFF434343),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Column(
  //                           children: [
  //                             Text(
  //                               "วัน",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                             SizedBox(height: 10),
  //                             Text(
  //                               "10",
  //                               style: TextStyle(
  //                                 fontSize: 18,
  //                                 color: Color(0xFF434343),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // -------------
  //               const SizedBox(
  //                 width: double.infinity,
  //                 child: Card(
  //                   elevation: 0,
  //                   color: Color(0xFFFFF0E5),
  //                   child: BaseLayoutPadding(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           "สรุปผล",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         SizedBox(height: 10),
  //                         Text(
  //                           "4.45 ปี",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Color(0xFFB76E00),
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 10),
  //               const SizedBox(
  //                 width: double.infinity,
  //                 child: BaseLayoutPadding(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "เคยเข้ารับการบำบัดรักษามาก่อนหรือไม่",
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       SizedBox(height: 10),
  //                       Text(
  //                         "ไม่เคย",
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           color: Color(0xFF434343),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 10),
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: Card(
  //                   elevation: 0,
  //                   color: const Color(0xFFF4F6F9),
  //                   child: BaseLayoutPadding(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         const Text(
  //                           "เหตุผลสำคัญที่เข้ารับการบำบัดรักษาครั้งนี้",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         const SizedBox(height: 10),
  //                         const Text(
  //                           "ปัญหาส่วนตัว",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         const SizedBox(height: 10),
  //                         Text(
  //                           _personalproblem.isNotEmpty
  //                               ? _personalproblem.join(', ')
  //                               : 'No data',
  //                           style: const TextStyle(
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                         const SizedBox(height: 10),
  //                         const Text(
  //                           "สิ่งแวดล้อม / สมัครใจ",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         const SizedBox(height: 10),
  //                         Text(
  //                           _environmentalvoluntar.isNotEmpty
  //                               ? _environmentalvoluntar.join(', ')
  //                               : 'No data',
  //                           style: const TextStyle(
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 15),
  //       SizedBox(
  //         width: double.infinity,
  //         child: Card(
  //           child: BaseLayoutPadding(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text(
  //                   "การบำบัดรักษา",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 const Text(
  //                   "การให้ยา",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 const Text(
  //                   "ให้ยา",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     color: Color(0xFF434343),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 const Text(
  //                   "เทคนิคการบำบัดฟื้นฟูสมรรถภาพ",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Text(
  //                   _rehabilitation.isNotEmpty
  //                       ? _rehabilitation.join(', ')
  //                       : 'No data',
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 const Text(
  //                   "โปรแกรมการบำบัดฟื้นฟูสมรรถภาพ",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Text(
  //                   _programoftherap.isNotEmpty
  //                       ? _programoftherap.join(', ')
  //                       : 'No data',
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 15),
  //       const SizedBox(
  //         width: double.infinity,
  //         child: Card(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               BaseLayoutPadding(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       "แบบประเมิน",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "คัดกรอง • ปัญหาสุขภาพทางจิต",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: 10),

  //               SizedBox(
  //                 width: double.infinity,
  //                 child: Card(
  //                   elevation: 0,
  //                   color: Color(0xFFFFF0E5),
  //                   child: BaseLayoutPadding(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           "สรุปผล",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         SizedBox(height: 10),
  //                         Text(
  //                           "ไม่มีอาการ",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Color(0xFF009951),
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 10),
  //               BaseLayoutPadding(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       "แบบประเมินพฤติกรรมก้าวร้าวรุนแรง",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "คุณใช้บ่อยเพียงใด?",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "ไม่เคย",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "คุณมีความต้องการหรือมีความรู้สึกอยากใช้ ยาบ้า จนทนไม่ได้บ่อยเพียงใด?",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "ไม่เคย",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "การใช้ ยาบ้า ทำให้คุณไม่สามารถรับผิดชอบ หรือทำกิจกรรมที่คุณเคยทำได้ตามปกติบ่อยเพียงใด",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "ไม่เคย",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "การใช้ ทำให้คุณเกิดปัญหาสุขภาพ ครอบครัว สังคม กฏหมาย หรือการเงินบ่อยเพียงใด?",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "เพียง 1-2 ครั้ง",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     Text(
  //                       "ญาติ เพื่อน หรือคนที่รู้จักเคยว่ากล่าวตักเตือน วิพากษ์วิจารณ์ จับผิด หรือแสดงท่าทีสงสัยว่าคุณเกี่ยวข้องกับ การใช้ ยาบ้า หรือไม่",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "ไม่เคย",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "คุณเคยลดหรือหยุดใช้ ยาบ้า แต่ไม่ประสบความสำเร็จ หรือไม่",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Text(
  //                       "ไม่เคย",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: 15),

  //               SizedBox(
  //                 width: double.infinity,
  //                 child: Card(
  //                   elevation: 0,
  //                   color: Color(0xFFFFF6F6),
  //                   child: BaseLayoutPadding(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "รวมคะแนนที่ได้",
  //                                   style: TextStyle(
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Text(
  //                                   "9",
  //                                   style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "ระดับผลกระทบจากการใช้",
  //                                   style: TextStyle(
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Text(
  //                                   "ปานกลาง",
  //                                   style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: 10,
  //                         ),
  //                         Text(
  //                           "ผลการคัดกรอง",
  //                           style: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         SizedBox(height: 10),
  //                         Text(
  //                           "ผู้เสพ",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Color(0xFFFFBD59),
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),

  //               // Text("data")
  //             ],
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 15),
  //       const SizedBox(
  //         width: double.infinity,
  //         child: Card(
  //           child: BaseLayoutPadding(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "สรุปผล",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "วันที่ประเมินผล",
  //                   style: TextStyle(fontSize: 18, color: Color(0xFF434343)),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Divider(
  //                   color: Color(0xFFDEE2E4),
  //                   thickness: 0.8,
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "การประเมินผลการบำบัดรักษา / ฟื้นฟูสมรรถภาพ",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "ติดตามไม่ได้",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     color: Color(0xFF434343),
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "ผลการรักษาอาการสุขภาพจิต",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "ไม่มีอาการสุขภาพจิต",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     color: Color(0xFF434343),
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "ผลการรักษาอาการสุขภาพทางกาย",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text(
  //                   "อาการทางสุขภาพกาย สงบ / ดีขึ้น",
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     color: Color(0xFF434343),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

