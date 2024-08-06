import 'package:bst_staff_mobile/data/network/api/dashboard-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Future<bool?> show2AuthDialog({
  required BuildContext context,
}) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('ข้อความแจ้งเตือน'),
      titleTextStyle: textTheme.titleMedium,
      icon: const Icon(
        Icons.info,
        size: 36,
      ),
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text("มีการยืนยัน 2 ระดับกรุณาเลือกการยินยันด้านล่าง"),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('ยืนยัน'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('ปิด'),
        ),
      ],
    ),
  );
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime? _selectedDate;
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    model = DashboardModel(
      log: Provider.of<Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    //onLoad();
  }

  void onLoad() async {
    final userSession = await model.findUserSession();
    if (userSession.status == "REQ_LOGIN") {
      final bool? complete = await show2AuthDialog(context: context);
      if (complete != null) {
        model.updateUserSession(complete);
      } else {
        model.updateUserSession(false);
      }
    }
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy', 'th_TH');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: MainColors.primary500,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/snapedit.png",
                  width: 115,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drug Treatment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Network",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: MainColors.background,
                    ),
                    Positioned(
                      right: 24,
                      bottom: 0,
                      top: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: IconButton(
                          icon: const Icon(
                            Icons.notifications_none,
                            color: MainColors.secondaryDark,
                            size: 30,
                          ),
                          onPressed: () {
                            print("ทดสอบจากระบบ");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // ignore: use_colored_box
      body: Container(
        color: MainColors.primary500,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BaseLayoutScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_selectedDate != null)
                                  Text(
                                    _formatDate(_selectedDate!),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 25,
                                    color: Color(0xFF4F4F4F),
                                  ),
                                  onPressed: () => _selectDate(context),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Allpatients(model: model)),
                                  Expanded(child: RetentionRate(model: model)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Register(model: model),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Screening(
                                      model: model,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Therapy(model: model)),
                                  const SizedBox(width: 5),
                                  Expanded(child: Keeptrack(model: model)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Help(model: model)),
                                  const SizedBox(width: 5),
                                  Expanded(child: Forward(model: model)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  Statistics(model: model),
                                  const SizedBox(height: 20),
                                  StatPatient(
                                    model: model,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}

// 1
class Allpatients extends StatefulWidget {
  final DashboardModel model;

  const Allpatients({super.key, required this.model});

  @override
  State<Allpatients> createState() => _AllpatientsState();
}

class _AllpatientsState extends State<Allpatients> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findpatients(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ผู้ป่วยทั้งหมด",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3D4245),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  // color: MainColors.primary500,
                  color: Color(0xFF3D4245),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "ผู้ป่วยทั้งหมด",
//           style: TextStyle(
//             fontSize: 18,
//             color: Color(0xFF3D4245),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Text(
//           "450 ",
//           style: TextStyle(
//             fontSize: 25,
//             color: Color(0xFF3D4245),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
// 2

// findTotalRetention

class RetentionRate extends StatefulWidget {
  final DashboardModel model;
  const RetentionRate({super.key, required this.model});

  @override
  State<RetentionRate> createState() => _RetentionRateState();
}

class _RetentionRateState extends State<RetentionRate> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findTotalRetention(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Retention Rate",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3D4245),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${count.toString()}%",
                style: const TextStyle(
                  fontSize: 25,
                  color: MainColors.primary500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
// 3

class Register extends StatelessWidget {
  final DashboardModel model;

  const Register({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalRegistering(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ลงทะเบียน",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// 4
class Screening extends StatefulWidget {
  final DashboardModel model;
  const Screening({super.key, required this.model});

  @override
  State<Screening> createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findTotalScreening(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "คัดกรอง",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// 5

class Therapy extends StatefulWidget {
  final DashboardModel model;
  const Therapy({super.key, required this.model});

  @override
  State<Therapy> createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findTotalTreatment(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "บำบัด",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
//

// 6
class Keeptrack extends StatefulWidget {
  final DashboardModel model;
  const Keeptrack({super.key, required this.model});

  @override
  State<Keeptrack> createState() => _KeeptrackState();
}

class _KeeptrackState extends State<Keeptrack> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findTotalMonitoring(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ติดตาม",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// findTotalAssistance
// 7

class Help extends StatefulWidget {
  final DashboardModel model;

  const Help({super.key, required this.model});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: widget.model.findTotalAssistance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final count = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ช่วยเหลือ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// 7
class Forward extends StatefulWidget {
  final DashboardModel model;
  const Forward({super.key, required this.model});

  @override
  State<Forward> createState() => _ForwardState();
}

class _ForwardState extends State<Forward> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Refer>(
      future: widget.model.findTotalRefer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final refer = snapshot.data!;
          final sender = refer.sender.toString();
          final receiver = refer.receiver.toString();

          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ส่งต่อ/รอรับ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: MainColors.primary500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        // count.toString(),
                        "$sender / $receiver",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D4245),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// -------------------------------------

class Statistics extends StatefulWidget {
  final DashboardModel model;

  const Statistics({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StatYear>(
      future: widget.model.findStatYear(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final valuestatistics = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "สถิติ (ปีงบประมาณ ${valuestatistics.year})",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        // pieTouchData: PieTouchData(
                        //   touchCallback:
                        //       (FlTouchEvent event, pieTouchResponse) {
                        //     setState(() {
                        //       if (!event.isInterestedForInteractions ||
                        //           pieTouchResponse == null ||
                        //           pieTouchResponse.touchedSection == null) {
                        //         touchedIndex = -1;
                        //         return;
                        //       }
                        //       touchedIndex = pieTouchResponse
                        //           .touchedSection!.touchedSectionIndex;
                        //     });
                        //   },
                        // ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 60,
                        sections: showingSections(valuestatistics),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${valuestatistics.total}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const Text(
                            'ผู้ป่วยทั้งหมด',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6A7180),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegend(
                    color: MainColors.primary500,
                    text: "ลงทะเบียน",
                    percentage:
                        "${valuestatistics.register.toStringAsFixed(2)}%",
                  ),
                  _buildLegend(
                    color: const Color(0xFF0EB366),
                    text: "คัดกรอง",
                    percentage:
                        "${valuestatistics.screening.toStringAsFixed(2)}%",
                  ),
                  _buildLegend(
                    color: const Color(0xFFFF5630),
                    text: "บำบัด",
                    percentage:
                        "${valuestatistics.treatment.toStringAsFixed(2)}%",
                  ),
                  _buildLegend(
                    color: const Color.fromARGB(128, 227, 165, 148),
                    text: "ติดตาม",
                    percentage:
                        "${valuestatistics.monitoring.toStringAsFixed(2)}%",
                  ),
                  _buildLegend(
                    color: const Color.fromARGB(128, 235, 153, 134),
                    text: "จำหน่าย",
                    percentage:
                        "${valuestatistics.discharged.toStringAsFixed(2)}%",
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

  List<PieChartSectionData> showingSections(StatYear valuestatistics) {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(blurRadius: 2)];

      double getValue(double value) {
        return double.parse(value.toStringAsFixed(2));
      }

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: MainColors.primary500,
            value: getValue(valuestatistics.register),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MainColors.primary50,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFF0EB366),
            value: getValue(valuestatistics.screening),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MainColors.primary50,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xFFFF5630),
            value: getValue(valuestatistics.treatment),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MainColors.primary50,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xFFFFCD3F),
            value: getValue(valuestatistics.monitoring),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MainColors.primary50,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xFFF2994A),
            value: getValue(valuestatistics.discharged),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MainColors.primary50,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  Widget _buildLegend({
    required Color color,
    required String text,
    required String percentage,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Center(
                  child: Icon(
                    Icons.circle,
                    color: color,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------
class StatPatient extends StatefulWidget {
  final DashboardModel model;
  const StatPatient({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _StatPatientState();
}

class _StatPatientState extends State<StatPatient> {
  List<int> daysInMonth = [];
  List<double> monthData = [];
  List<double> weekData = [];
  bool isLoading = false;

  int touchedIndex = -1;
  int selectedIndex = 0;
  int newPatientMonth = 0;
  int newPatientWeek = 0;

  @override
  void initState() {
    super.initState();
    generateDaysInMonth();
    loadData();
  }

  void generateDaysInMonth() {
    final DateTime now = DateTime.now();
    final int daysCount = DateUtils.getDaysInMonth(now.year, now.month);
    daysInMonth = List<int>.generate(daysCount, (i) => i + 1);
  }

  Future<void> loadData() async {
    final tempMonth = await widget.model.findStatPatientMonth();
    final tempWeek = await widget.model.findStatPatientWeek();
    monthData = tempMonth.dataMonth;
    newPatientMonth = tempMonth.newPatientMonth;
    weekData = tempWeek.dataWeek;
    newPatientWeek = tempWeek.newPatientWeek;
    setState(() {
      isLoading = true;
    });
  }

  void onTextTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildSelectableText(String text, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTextTapped(index),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFFFFFFFF) : const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(isSelected ? 0 : 0),
              bottomRight: Radius.circular(isSelected ? 0 : 0),
              bottomLeft: Radius.circular(isSelected ? 10 : 0),
              topLeft: Radius.circular(isSelected ? 10 : 0),
            ),
            border: Border.all(
              color: isSelected ? const Color(0xFFFFFFFF) : Colors.transparent,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final TextStyle style = TextStyle(
      fontSize: selectedIndex == 0 ? 13 : 10,
    );
    String text = '';
    if (selectedIndex == 0) {
      text = (value.toInt() < 7
              ? ['จ', 'อ', 'พ', 'ฤ', 'ศ', 'ส', 'อ'][value.toInt()]
              : '')
          .toString();
    } else if (selectedIndex == 1) {
      text = (value.toInt() < daysInMonth.length
          ? daysInMonth[value.toInt()].toString()
          : '');
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? const Text("Loading...")
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "สถิติผู้ป่วย",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF242B42),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          buildSelectableText("สัปดาร์", 0),
                          buildSelectableText("เดือน", 1),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        selectedIndex == 0
                            ? newPatientWeek.toString()
                            : newPatientMonth.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xFF242B42),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        FontAwesomeIcons.chartLine,
                        color: Color(0xFF36CB69),
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 10),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.66,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double barsSpace;
                            double barsWidth;
                            // week
                            if (selectedIndex == 0) {
                              barsSpace = 8.0 * constraints.maxWidth / 200;
                              barsWidth =
                                  (constraints.maxWidth - (barsSpace * 6)) / 8;
                            } else {
                              // เดือน
                              barsSpace = 8.0 * constraints.maxWidth / 55;
                              barsWidth =
                                  (constraints.maxWidth - (barsSpace * 6)) / 15;
                            }

                            return BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.center,
                                barTouchData: BarTouchData(
                                  enabled: true,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipPadding: const EdgeInsets.all(8),
                                    tooltipMargin: 4,
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) {
                                      return BarTooltipItem(
                                        '${(selectedIndex == 0 ? (group.x + 1) : daysInMonth[group.x])}: ${rod.toY}',
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                  touchCallback:
                                      (FlTouchEvent event, barTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          barTouchResponse == null ||
                                          barTouchResponse.spot == null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = barTouchResponse
                                          .spot!.touchedBarGroupIndex;
                                    });
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 28,
                                      getTitlesWidget: bottomTitles,
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: leftTitles,
                                    ),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                gridData: FlGridData(
                                  checkToShowHorizontalLine: (value) =>
                                      value % 10 == 0,
                                  getDrawingHorizontalLine: (value) => FlLine(
                                    color: Colors.grey.withOpacity(0.1),
                                    strokeWidth: 1,
                                  ),
                                  drawVerticalLine: false,
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                groupsSpace: barsSpace,
                                barGroups: selectedIndex == 0
                                    ? weekChartWidget(barsWidth, barsSpace)
                                    : monthChartWidget(barsWidth, barsSpace),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  List<BarChartGroupData> weekChartWidget(double barsWidth, double barsSpace) {
    if (weekData.length != 7) {
      return [];
    }

    return List<BarChartGroupData>.generate(7, (index) {
      final bool isTouched = index == touchedIndex;
      final double y = weekData[index];
      return BarChartGroupData(
        x: index,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: y,
            rodStackItems: [
              BarChartRodStackItem(0, y, isTouched ? Colors.red : Colors.blue),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      );
    });
  }

  List<BarChartGroupData> monthChartWidget(double barsWidth, double barsSpace) {
    if (monthData.length != daysInMonth.length) {
      return [];
    }

    return List<BarChartGroupData>.generate(monthData.length, (index) {
      final bool isTouched = index == touchedIndex;
      final double y = monthData[index];
      return BarChartGroupData(
        x: index,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: y,
            rodStackItems: [
              BarChartRodStackItem(0, y, isTouched ? Colors.red : Colors.blue),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      );
    });
  }
}
