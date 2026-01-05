
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class DonutcardWidget extends StatelessWidget {
  const DonutcardWidget({super.key});
  @override
  Widget build(BuildContext context) {
       return  Card(
     
      color: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Overall Report",
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: SfCircularChart(
                      series: [
                        DoughnutSeries<_ChartData, String>(
                          radius: '80%',
                          innerRadius: '60%',
                          dataSource: [
                            _ChartData(
                                'Total Earned', 50, Colors.blue),
                            _ChartData(
                                'Total Redeem', 20, Colors.red),
                            _ChartData(
                                'Balance Points', 30, Colors.purple),
                          ],
                          xValueMapper: (d, _) => d.category,
                          yValueMapper: (d, _) => d.value,
                          pointColorMapper: (d, _) => d.color,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _LegendItem(
                        color: Colors.blue, text: "Total Earned"),
                    _LegendItem(
                        color: Colors.red, text: "Total Redeem"),
                    _LegendItem(
                        color: Colors.purple,
                        text: "Balance Points"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
  
    );
  }
}

class _ChartData {
  final String category;
  final double value;
  final Color color;
  _ChartData(this.category, this.value, this.color);
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
