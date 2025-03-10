// import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
// import 'package:bst_staff_mobile/domain/model/dashboard.dart';
// import 'package:bst_staff_mobile/domain/service/app_service.dart';
// import 'package:bst_staff_mobile/presentation/_dashboard/dashboard-model.dart';
// import 'package:bst_staff_mobile/presentation/_dashboard/screen/report-data-screen.dart';
// import 'package:bst_staff_mobile/theme/font-size.dart';
// import 'package:bst_staff_mobile/theme/main-colors.dart';
// import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart' as lg;
// import 'package:provider/provider.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   String _formatDate(DateTime date) {
//     final DateFormat formatter = DateFormat('dd MMMM yyyy', 'th_TH');
//     return formatter.format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime selectedDate = DateTime.now();
//     final appService = Provider.of<AppService>(context, listen: false);

//     return Scaffold(
//       backgroundColor: MainColors.primary500,
//       // appBar: BaseAppbar(),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               MainColors.primary500,
//               Colors.white,
//             ],
//             stops: [-0.017, 1.2193],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             transform: GradientRotation(280 * (3.14159 / 50)),
//           ),
//           color: Colors.white12,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(20.0),
//                   scrollDirection: Axis.vertical,
//                   child: FutureBuilder(
//                     future: appService.loadPermission(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Container();
//                       } else if (snapshot.hasError) {
//                         return Container();
//                       } else {
//                         return Column(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFF9F9F9),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     _formatDate(selectedDate),
//                                     style: const TextStyle(
//                                       fontSize: FontSizes.medium,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             Column(
//                               children: [
//                                 const Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Allpatients(),
//                                     RetentionRate(),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 16),
//                                 const WorkflowTotalContent(),
//                                 const SizedBox(height: 16),
//                                 const Statistics(),
//                                 const StatPatient(),
//                                 const SizedBox(height: 16),
//                                 if (appService.getReportPermission()) ...[
//                                   const ReportDataTable(),
//                                 ],
//                               ],
//                             ),
//                           ],
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 1
// class Allpatients extends StatefulWidget {
//   const Allpatients({
//     super.key,
//   });

//   @override
//   State<Allpatients> createState() => _AllpatientsState();
// }

// class _AllpatientsState extends State<Allpatients> {
//   late final DashboardModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = DashboardModel(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<int>(
//       future: model.findpatients(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('ไม่พบข้อมูล'));
//         } else {
//           final count = snapshot.data!;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "ผู้ป่วยทั้งหมด",
//                 style: TextStyle(
//                   fontSize: FontSizes.medium,
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 count.toString(),
//                 style: const TextStyle(
//                   fontSize: FontSizes.large,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

// // findTotalRetention

// class RetentionRate extends StatefulWidget {
//   const RetentionRate({
//     super.key,
//   });

//   @override
//   State<RetentionRate> createState() => _RetentionRateState();
// }

// class _RetentionRateState extends State<RetentionRate> {
//   late final DashboardModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = DashboardModel(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<int>(
//       future: model.findTotalRetention(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('ไม่พบข้อมูล'));
//         } else {
//           final count = snapshot.data!;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 "Retention Rate",
//                 style: TextStyle(
//                   fontSize: FontSizes.medium,
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "$count%",
//                 style: const TextStyle(
//                   fontSize: FontSizes.large,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

// // 3

// class WorkflowTotalContent extends StatefulWidget {
//   const WorkflowTotalContent({
//     super.key,
//   });

//   @override
//   _WorkflowTotalContentState createState() => _WorkflowTotalContentState();
// }

// class _WorkflowTotalContentState extends State<WorkflowTotalContent> {
//   late final DashboardModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = DashboardModel(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WorkFlowTotal>(
//       future: model.findWorkFlowTotal(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('ไม่พบข้อมูล'));
//         } else {
//           final data = snapshot.data!;
//           return Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: registering(data.countRegistering),
//                   ),
//                   const SizedBox(width: 5),
//                   Expanded(
//                     child: screening(data.countScreening),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: treatment(data.countTreatment),
//                   ),
//                   const SizedBox(width: 5),
//                   Expanded(
//                     child: monitoring(data.countMonitoring),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: assistance(data.countAssistance),
//                   ),
//                   const SizedBox(width: 5),
//                   const Expanded(
//                     child: ReferContent(),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }

//   Widget registering(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "ลงทะเบียน",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget screening(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "คัดกรอง",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget treatment(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "บำบัด",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget monitoring(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "ติดตาม",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget assistance(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "ช่วยเหลือ",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget discharged(int count) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "ลงทะเบียน",
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   count.toString(),
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 7
// class ReferContent extends StatefulWidget {
//   const ReferContent({
//     super.key,
//   });

//   @override
//   State<ReferContent> createState() => _ReferContentState();
// }

// class _ReferContentState extends State<ReferContent> {
//   late final DashboardModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = DashboardModel(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Refer>(
//       future: model.findTotalRefer(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('ไม่พบข้อมูล'));
//         } else {
//           final refer = snapshot.data!;
//           final sender = refer.sender.toString();
//           final receiver = refer.receiver.toString();

//           return SizedBox(
//             width: double.infinity,
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "ส่งต่อ/รอรับ",
//                             style: TextStyle(
//                               fontSize: FontSizes.medium,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "$sender / $receiver",
//                         style: const TextStyle(
//                           fontSize: FontSizes.medium,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class Statistics extends StatefulWidget {
//   const Statistics({
//     super.key,
//   });

//   @override
//   State<StatefulWidget> createState() => StatisticsState();
// }

// class StatisticsState extends State<Statistics> {
//   late final DashboardModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = DashboardModel(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Level>(
//       future: model.findLevel(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return const Center(child: Text('ไม่พบข้อมูล'));
//         } else {
//           final level = snapshot.data!;

//           return Column(
//             children: [
//               StatisticsLevel(
//                 level: level,
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

// class StatisticsLevel extends StatefulWidget {
//   final Level level;

//   const StatisticsLevel({
//     super.key,
//     required this.level,
//   });

//   @override
//   _StatisticsLevelState createState() => _StatisticsLevelState();
// }

// class _StatisticsLevelState extends State<StatisticsLevel> {
//   String type = "screening";

//   void _handleTypeChange(String newType) {
//     setState(() {
//       type = newType;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final level = widget.level;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Flex(
//           direction: Axis.horizontal,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "สถิติ(ปีงบประมาณ ${level.year})",
//               style: const TextStyle(
//                 fontSize: FontSizes.large,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   type == "screening" ? 'คัดกรอง' : 'บำบัด',
//                   style: const TextStyle(
//                     fontSize: FontSizes.medium,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Switch(
//                   value: type == "screening",
//                   onChanged: (value) {
//                     _handleTypeChange(value ? "screening" : "treatment");
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 40),
//         SizedBox(
//           height: 200,
//           child: Stack(
//             children: [
//               PieChart(
//                 PieChartData(
//                   startDegreeOffset: 180,
//                   borderData: FlBorderData(
//                     show: false,
//                   ),
//                   sectionsSpace: 4,
//                   centerSpaceRadius: 60,
//                   sections: _levelPieChart(level, type),
//                 ),
//               ),
//               Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       type == "screening"
//                           ? level.screeningTotal.toString()
//                           : level.treatmentTotal.toString(),
//                       style: const TextStyle(
//                         fontSize: FontSizes.large,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF333333),
//                       ),
//                     ),
//                     const Text(
//                       'ผู้ป่วยทั้งหมด',
//                       style: TextStyle(
//                         fontSize: FontSizes.medium,
//                         color: Color(0xFF6A7180),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 40),
//         _levelText(level, type),
//       ],
//     );
//   }

//   List<PieChartSectionData> _levelPieChart(Level level, String type) {
//     if (type == "screening") {
//       return [
//         PieChartSectionData(
//           color: const Color(0xFF11b366),
//           value: level.screeningNormalCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFffcd3f),
//           value: level.screeningSemiUrgencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFf2994a),
//           value: level.screeningUrgencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFff5631),
//           value: level.screeningEmergencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//       ];
//     } else {
//       return [
//         PieChartSectionData(
//           color: const Color(0xFF11b366),
//           value: level.treatmentNormalCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFffcd3f),
//           value: level.treatmentSemiUrgencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFf2994a),
//           value: level.treatmentUrgencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//         PieChartSectionData(
//           color: const Color(0xFFff5631),
//           value: level.treatmentEmergencyCount.toDouble(),
//           title: '',
//           titleStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: MainColors.primary50,
//           ),
//         ),
//       ];
//     }
//   }

//   Widget _levelText(Level level, String type) {
//     if (type == "screening") {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildLegend(
//             color: const Color(0xFF11b366),
//             text: "เขียว",
//             percentage:
//                 "${level.screeningNormalCount} (${level.screeningNormalPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFffcd3f),
//             text: "เหลือง",
//             percentage:
//                 "${level.screeningSemiUrgencyCount} (${level.screeningSemiUrgencyPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFf2994a),
//             text: "ส้ม",
//             percentage:
//                 "${level.screeningUrgencyCount} (${level.screeningUrgencyPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFff5631),
//             text: "แดง",
//             percentage:
//                 "${level.screeningEmergencyCount} (${level.screeningEmergencyPercent.toStringAsFixed(2)}%)",
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildLegend(
//             color: const Color(0xFF11b366),
//             text: "เขียว",
//             percentage:
//                 "${level.treatmentNormalCount} (${level.treatmentNormalPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFffcd3f),
//             text: "เหลือง",
//             percentage:
//                 "${level.treatmentSemiUrgencyCount} (${level.treatmentSemiUrgencyPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFf2994a),
//             text: "ส้ม",
//             percentage:
//                 "${level.treatmentUrgencyCount} (${level.treatmentUrgencyPercent.toStringAsFixed(2)}%)",
//           ),
//           _buildLegend(
//             color: const Color(0xFFff5631),
//             text: "แดง",
//             percentage:
//                 "${level.treatmentEmergencyCount} (${level.treatmentEmergencyPercent.toStringAsFixed(2)}%)",
//           ),
//         ],
//       );
//     }
//   }

//   Widget _buildLegend({
//     required Color color,
//     required String text,
//     required String percentage,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Container(
//             width: 20,
//             height: 20,
//             color: color,
//           ),
//           const SizedBox(width: 10),
//           Text(text),
//           const Spacer(),
//           Text(percentage),
//         ],
//       ),
//     );
//   }
// }

// class ReportDataTable extends StatefulWidget {
//   const ReportDataTable({super.key});

//   @override
//   State<ReportDataTable> createState() => _ReportDataTableState();
// }

// class _ReportDataTableState extends State<ReportDataTable> {
//   late ReportDataProvider _model;

//   @override
//   void initState() {
//     super.initState();
//     _model = ReportDataProvider(
//       log: Provider.of<lg.Logger>(super.context, listen: false),
//       dashboardRepository:
//           Provider.of<DashboardRepository>(super.context, listen: false),
//       appService: Provider.of<AppService>(super.context, listen: false),
//     );
//   }

//   void _onSearchNameChanged(String value) {
//     _model.search(value);
//   }

//   void _onClickRow(ReportData data) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ReportDataScreen(
//           parentName: data.name,
//           districtId: data.districtId,
//           healthServiceId: data.healthServiceId,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ReportDataProvider>.value(
//       value: _model,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'รายงาน',
//             style: TextStyle(
//               fontSize: FontSizes.large,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             constraints: const BoxConstraints(
//               maxWidth: 600,
//             ), // Set the maximum width here
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: "ค้นหาจากชื่อ",
//               ),
//               onChanged: _onSearchNameChanged,
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           FutureBuilder<bool>(
//             future: _model.findReportData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData) {
//                 return const Center(child: Text('ไม่พบข้อมูล'));
//               } else {
//                 return Consumer<ReportDataProvider>(
//                   builder: (context, model, child) {
//                     final data = model.reportDatas;
//                     return ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minWidth: MediaQuery.of(context).size.width,
//                       ),
//                       child: PaginatedDataTable(
//                         columns: const [
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('ชื่อ'),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('ลงทะเบียน'),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('คัดกรอง'),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('บำบัด'),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('ติดตาม'),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Flexible(
//                               child: Text('Retention Rate %'),
//                             ),
//                           ),
//                         ],
//                         source: ReportDataTableSource(data, _onClickRow),
//                         rowsPerPage: 10, // Set pagination to 10 rows per page
//                         showCheckboxColumn: false,
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ReportDataTableSource extends DataTableSource {
//   final List<ReportData> data;
//   final void Function(ReportData) onClickRow;

//   ReportDataTableSource(this.data, this.onClickRow);

//   @override
//   DataRow getRow(int index) {
//     final item = data[index];
//     return DataRow.byIndex(
//       index: index,
//       cells: [
//         DataCell(
//           (item.districtId > 0 || item.healthServiceId > 0)
//               ? TextButton.icon(
//                   onPressed: () {
//                     onClickRow(item);
//                   },
//                   icon: const Icon(
//                     Icons.visibility,
//                   ), // Add your desired icon here
//                   label: Text(item.name),
//                 )
//               : Text(item.name),
//         ),
//         DataCell(Text(item.register)),
//         DataCell(Text(item.screening)),
//         DataCell(Text(item.treatment)),
//         DataCell(Text(item.monitoring)),
//         DataCell(Text(item.retentionRate)),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => data.length;

//   @override
//   int get selectedRowCount => 0;
// }
