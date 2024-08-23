import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/dashboard/dashboard-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart' as lg;
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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy', 'th_TH');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDate = DateTime.now();

    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: BaseAppbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MainColors.primary500,
              Colors.white,
            ],
            stops: [-0.017, 1.2193],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(280 * (3.14159 / 50)),
          ),
          color: Colors.white12,
        ),
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
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _formatDate(selectedDate),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Allpatients()),
                                  Expanded(child: RetentionRate()),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Register(),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Screening(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Therapy()),
                                  SizedBox(width: 5),
                                  Expanded(child: Keeptrack()),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Help()),
                                  SizedBox(width: 5),
                                  Expanded(child: Forward()),
                                ],
                              ),
                              SizedBox(height: 20),
                              Statistics(),
                              StatPatient(),
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
}

// 1
class Allpatients extends StatefulWidget {
  const Allpatients({
    super.key,
  });

  @override
  State<Allpatients> createState() => _AllpatientsState();
}

class _AllpatientsState extends State<Allpatients> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findpatients(),
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
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 25,
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

// findTotalRetention

class RetentionRate extends StatefulWidget {
  const RetentionRate({
    super.key,
  });

  @override
  State<RetentionRate> createState() => _RetentionRateState();
}

class _RetentionRateState extends State<RetentionRate> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalRetention(),
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
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "$count%",
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

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

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
  const Screening({super.key});

  @override
  State<Screening> createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalScreening(),
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
  const Therapy({
    super.key,
  });

  @override
  State<Therapy> createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalTreatment(),
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
  const Keeptrack({
    super.key,
  });

  @override
  State<Keeptrack> createState() => _KeeptrackState();
}

class _KeeptrackState extends State<Keeptrack> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalMonitoring(),
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
  const Help({
    super.key,
  });

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: model.findTotalAssistance(),
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
  const Forward({
    super.key,
  });

  @override
  State<Forward> createState() => _ForwardState();
}

class _ForwardState extends State<Forward> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Refer>(
      future: model.findTotalRefer(),
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
                        "$sender / $receiver",
                        style: const TextStyle(
                          fontSize: 18,
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

class Statistics extends StatefulWidget {
  const Statistics({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  late final DashboardModel model;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Level>(
      future: model.findLevel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final level = snapshot.data!;

          return Column(
            children: [
              StatisticsLevel(
                level: level,
              ),
            ],
          );
        }
      },
    );
  }
}

class StatisticsLevel extends StatefulWidget {
  final Level level;

  const StatisticsLevel({
    super.key,
    required this.level,
  });

  @override
  _StatisticsLevelState createState() => _StatisticsLevelState();
}

class _StatisticsLevelState extends State<StatisticsLevel> {
  String type = "screening";

  void _handleTypeChange(String newType) {
    setState(() {
      type = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final level = widget.level;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "สถิติ ฟหก (ปีงบประมาณ ${level.year})",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  type == "screening" ? 'คัดกรอง' : 'บำบัด',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Switch(
                  value: type == "screening",
                  onChanged: (value) {
                    _handleTypeChange(value ? "screening" : "treatment");
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 4,
                  centerSpaceRadius: 60,
                  sections: _levelPieChart(level, type),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      type == "screening"
                          ? level.screeningTotal.toString()
                          : level.treatmentTotal.toString(),
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
        _levelText(level, type),
      ],
    );
  }

  List<PieChartSectionData> _levelPieChart(Level level, String type) {
    if (type == "screening") {
      return [
        PieChartSectionData(
          color: const Color(0xFF11b366),
          value: level.screeningNormalCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFffcd3f),
          value: level.screeningSemiUrgencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFf2994a),
          value: level.screeningUrgencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFff5631),
          value: level.screeningEmergencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: const Color(0xFF11b366),
          value: level.treatmentNormalCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFffcd3f),
          value: level.treatmentSemiUrgencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFf2994a),
          value: level.treatmentUrgencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFff5631),
          value: level.treatmentEmergencyCount.toDouble(),
          title: '',
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainColors.primary50,
          ),
        ),
      ];
    }
  }

  Widget _levelText(Level level, String type) {
    if (type == "screening") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLegend(
            color: const Color(0xFF11b366),
            text: "เขียว",
            percentage:
                "${level.screeningNormalCount} (${level.screeningNormalPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFffcd3f),
            text: "เหลือง",
            percentage:
                "${level.screeningSemiUrgencyCount} (${level.screeningSemiUrgencyPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFf2994a),
            text: "ส้ม",
            percentage:
                "${level.screeningUrgencyCount} (${level.screeningUrgencyPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFff5631),
            text: "แดง",
            percentage:
                "${level.screeningEmergencyCount} (${level.screeningEmergencyPercent.toStringAsFixed(2)}%)",
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLegend(
            color: const Color(0xFF11b366),
            text: "เขียว",
            percentage:
                "${level.treatmentNormalCount} (${level.treatmentNormalPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFffcd3f),
            text: "เหลือง",
            percentage:
                "${level.treatmentSemiUrgencyCount} (${level.treatmentSemiUrgencyPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFf2994a),
            text: "ส้ม",
            percentage:
                "${level.treatmentUrgencyCount} (${level.treatmentUrgencyPercent.toStringAsFixed(2)}%)",
          ),
          _buildLegend(
            color: const Color(0xFFff5631),
            text: "แดง",
            percentage:
                "${level.treatmentEmergencyCount} (${level.treatmentEmergencyPercent.toStringAsFixed(2)}%)",
          ),
        ],
      );
    }
  }

  Widget _buildLegend({
    required Color color,
    required String text,
    required String percentage,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: color,
          ),
          const SizedBox(width: 10),
          Text(text),
          const Spacer(),
          Text(percentage),
        ],
      ),
    );
  }
}

// ---------
class StatPatient extends StatefulWidget {
  const StatPatient({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StatPatientState();
}

class _StatPatientState extends State<StatPatient> {
  late final DashboardModel model;

  List<double> monthData = [];
  List<double> weekData = [];
  List<String> weekTexts = [
    "จันทร์",
    "อังคาร",
    "พุธ",
    "พฤหัสบดี",
    "ศุกร์",
    "เสาร์",
    "อาทิตย์",
  ];
  List<String> yearTexts = [
    "ม.ค.",
    "ก.พ.",
    "มี.ค.",
    "เม.ย.",
    "พ.ค.",
    "มิ.ย.",
    "ก.ค.",
    "ส.ค.",
    "ก.ย.",
    "ต.ค.",
    "พ.ย.",
    "ธ.ค.",
  ];
  bool isLoading = false;

  int touchedIndex = -1;
  int selectedIndex = 0;
  int newPatientMonth = 0;
  int newPatientWeek = 0;

  @override
  void initState() {
    super.initState();
    model = DashboardModel(
      log: Provider.of<lg.Logger>(super.context, listen: false),
      dashboardRepository:
          Provider.of<DashboardRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    loadData();
  }

  Future<void> loadData() async {
    final tempMonth = await model.findStatPatientMonth();
    final tempWeek = await model.findStatPatientWeek();
    monthData = tempMonth.dataMonth;
    newPatientMonth = tempMonth.newPatientMonth;
    weekData = tempWeek.dataWeek;
    newPatientWeek = tempWeek.newPatientWeek;

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
  }

  void onTextTapped(int index) {
    if (mounted) {
      setState(() {
        selectedIndex = index;
      });
    }
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
              color: isSelected
                  ? MainColors.text600
                  : Colors.black.withOpacity(0.5),
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
      text = weekTexts[value.toInt()];
    } else if (selectedIndex == 1) {
      text = yearTexts[value.toInt()];
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          buildSelectableText("สัปดาร์", 0),
                          buildSelectableText("ปี", 1),
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
                          color: MainColors.text600,
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
                                        selectedIndex == 0
                                            ? weekTexts[group.x]
                                            : yearTexts[group.x],
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
                                  topTitles: const AxisTitles(),
                                  rightTitles: const AxisTitles(),
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
