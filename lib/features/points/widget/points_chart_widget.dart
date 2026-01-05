import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PointsChart extends StatelessWidget {
  const PointsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: 700, color: Colors.blue),
                BarChartRodData(toY: 300, color: Colors.red),
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 900, color: Colors.blue),
                BarChartRodData(toY: 500, color: Colors.red),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
