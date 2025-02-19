import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardLevel extends StatefulWidget {
  final Level level;

  const DashboardLevel({
    super.key,
    required this.level,
  });

  @override
  _DashboardLevelState createState() => _DashboardLevelState();
}

class _DashboardLevelState extends State<DashboardLevel> {
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
              "สถิติ(ปีงบประมาณ ${level.year})",
              style: const TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  type == "screening" ? 'คัดกรอง' : 'บำบัด',
                  style: const TextStyle(
                    fontSize: FontSizes.medium,
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
                        fontSize: FontSizes.large,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const Text(
                      'ผู้ป่วยทั้งหมด',
                      style: TextStyle(
                        fontSize: FontSizes.medium,
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
