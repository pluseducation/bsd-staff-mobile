import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class DashboardStat extends StatefulWidget {
  final StatPatientWeek statPatientWeek;
  final StatPatientMonth statPatientMonth;

  const DashboardStat({
    super.key,
    required this.statPatientWeek,
    required this.statPatientMonth,
  });

  @override
  State<DashboardStat> createState() => _DashboardStatState();
}

class _DashboardStatState extends State<DashboardStat> {
  int newPatientMonth = 0;
  int newPatientWeek = 0;
  List<double> dataMonth = [];
  List<double> dataWeek = [];

  int touchedIndex = -1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    newPatientMonth = widget.statPatientMonth.newPatientMonth;
    newPatientWeek = widget.statPatientWeek.newPatientWeek;
    dataMonth = widget.statPatientMonth.dataMonth;
    dataWeek = widget.statPatientWeek.dataWeek;
  }

  void _onTapped(int index) {
    if (mounted) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    buildSelectableText("สัปดาร์", 0, false),
                    buildSelectableText("ปี", 1, true),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  selectedIndex == 0
                      ? newPatientWeek.toString()
                      : newPatientMonth.toString(),
                  style: const TextStyle(
                    fontSize: FontSizes.large,
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
                                touchedIndex =
                                    barTouchResponse.spot!.touchedBarGroupIndex;
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

  Widget buildSelectableText(String text, int index, bool isRight) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTapped(index),
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? MainColors.white : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(isRight ? 15 : 0),
            bottomRight: Radius.circular(isRight ? 15 : 0),
            bottomLeft: Radius.circular(!isRight ? 15 : 0),
            topLeft: Radius.circular(!isRight ? 15 : 0),
          ),
        ),
        child: Center(
          // Center aligns the text
          child: Text(
            text,
            textAlign: TextAlign
                .center, // Ensures text is centered within the Text widget
            style: TextStyle(
              fontSize: FontSizes.medium,
              color: isSelected ? Colors.black87 : MainColors.text,
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
      meta: meta,
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
      meta: meta,
      space: 12,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  List<BarChartGroupData> weekChartWidget(double barsWidth, double barsSpace) {
    if (dataWeek.length != 7) {
      return [];
    }

    return List<BarChartGroupData>.generate(7, (index) {
      final bool isTouched = index == touchedIndex;
      final double y = dataWeek[index];
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
    return List<BarChartGroupData>.generate(dataMonth.length, (index) {
      final bool isTouched = index == touchedIndex;
      final double y = dataMonth[index];
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
