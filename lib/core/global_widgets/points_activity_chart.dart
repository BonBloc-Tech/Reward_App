import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PointsActivityChart extends StatelessWidget {
  const PointsActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// TITLE
          const Text(
            "Points Activity (Last 6 Months)",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 12),

          /// CHART
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 1400,
                groupsSpace: 14,
                alignment: BarChartAlignment.spaceAround,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 350,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFE5E7EB),
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 350,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9CA3AF),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            months[value.toInt()],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),

                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(color: Color(0xFFD1D5DB)),
                    bottom: BorderSide(color: Color(0xFFD1D5DB)),
                  ),
                ),

                barTouchData: BarTouchData(enabled: false),
                barGroups: _barGroups(),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// LEGEND (CENTER)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _Legend(color: Color(0xFF2563EB), text: "Points Earned"),
              SizedBox(width: 14),
              _Legend(color: Color(0xFFDC2626), text: "Points Redeemed"),
            ],
          ),
          
          const SizedBox(height: 40),

          /// SUMMARY CARDS (CENTER)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 200,
                child: _SummaryCard(
                  title: "Earned Points",
                  value: "6,500",
                  bgColor: Color(0xFFEFF4FF),
                  valueColor: Color(0xFF2563EB),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 200,
                child: _SummaryCard(
                  title: "Redeemed Points",
                  value: "2,400",
                  bgColor: Color(0xFFFFF1F0),
                  valueColor: Color(0xFFDC2626),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// BAR GROUPS
  List<BarChartGroupData> _barGroups() {
    final earned = [1200, 950, 1400, 700, 1100, 900];
    final redeemed = [350, 600, 400, 200, 750, 400];

    return List.generate(6, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 6,
        barRods: [
          BarChartRodData(
            toY: earned[index].toDouble(),
            width: 25,
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: redeemed[index].toDouble(),
            width: 25,
            color: const Color(0xFFDC2626),
            borderRadius: BorderRadius.zero,
          ),
        ],
      );
    });
  }
}

/// LEGEND WIDGET
class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// SUMMARY CARD
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color bgColor;
  final Color valueColor;
  final BorderRadius borderRadius;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.bgColor,
    required this.valueColor,
    // ignore: unused_element_parameter
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius, // ✅ FIXED
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

