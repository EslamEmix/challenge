import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_colors.dart';

class LineGraphWidget extends StatelessWidget {
  const LineGraphWidget({super.key, required this.spots});

  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return LineGraphView(spots: spots);
    return Container(
      constraints: const BoxConstraints(minWidth: 500),
      color: Colors.red,
      child: Stack(fit: StackFit.expand, children: [
        Column(
          children: [
            const Text(
              'Monthly Sales',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: Container(
                    constraints: const BoxConstraints(minWidth: 500),
                    child: LineGraphView(spots: spots))),
          ],
        )
      ]),
    );
  }
}

class LineGraphView extends StatefulWidget {
  const LineGraphView({super.key, required this.spots});

  final List<FlSpot> spots;

  @override
  State<LineGraphView> createState() => _LineGraphViewState();
}

class _LineGraphViewState extends State<LineGraphView> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  Widget dateTitlesWidget(value, meta) {
    String monthName = DateFormat.MMMM().format(DateTime(0, value));
    return Text(monthName);
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      gridData: const FlGridData(),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            axisNameWidget: Text("Year 2021"),
            axisNameSize: 50,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: dateTitlesWidget,
              interval: 1,
            )),
        leftTitles: AxisTitles(
          axisNameWidget: const Text("number of orders"),
          axisNameSize: 50,
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text("$value"),
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
            axisNameSize: 80,
            axisNameWidget: Text("")),
        rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
            axisNameSize: 80,
            axisNameWidget: Text("")),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: widget.spots,
          isCurved: true,
          curveSmoothness: 0.35,
          preventCurveOverShooting: true,
          color: Colors.blue,
          barWidth: 4,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    ));
  }
}
