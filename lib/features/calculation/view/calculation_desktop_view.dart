import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import '../controller/calculation_controller.dart';
import '../widget/invoice_table_widget.dart';
import '../widget/points_summary_overview_card_widget.dart';
import '../widget/rules_card_widget.dart';

class PointsCalculationPage extends StatefulWidget {
  const PointsCalculationPage({super.key});

  @override
  State<PointsCalculationPage> createState() =>
      _PointsCalculationPageState();
}

class _PointsCalculationPageState extends State<PointsCalculationPage> {
  /// 🔹 ORDER (VERTICAL)
  List<String> layoutOrder = ['rules', 'summary', 'table'];

  void swap(String from, String to) {
    setState(() {
      final fromIndex = layoutOrder.indexOf(from);
      final toIndex = layoutOrder.indexOf(to);
      final temp = layoutOrder[fromIndex];
      layoutOrder[fromIndex] = layoutOrder[toIndex];
      layoutOrder[toIndex] = temp;
    });
  }

  Widget section(String id) {
    switch (id) {
      case 'rules':
        return const RulesCard();

      case 'summary':
        return const PointsSummaryOverviewCard();

      case 'table':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Invoice Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            InvoiceTable(),
          ],
        );

      default:
        return const SizedBox();
    }
  }

  Widget draggableSection(String id) {
    return DragTarget<String>(
      // ignore: unrelated_type_equality_checks
      onWillAcceptWithDetails: (from) => from != id,
      onAcceptWithDetails: (from) => swap(from as String, id),
      builder: (context, _, __) {
        return Draggable<String>(
          data: id,
          feedback: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: section(id),
            ),
          ),
          childWhenDragging:
              Opacity(opacity: 0.3, child: section(id)),
          child: section(id),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CalculationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Row(
        children: [
          const SideMenu(),

          Expanded(
            child: Column(
              children: [
                /// 🔹 HEADER
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Points Calculation Page',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.account_circle, size: 32),
                      SizedBox(width: 8),
                      Text(
                        'BHARAT KALRA & CO',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                /// 🔹 BODY
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        /// 🔹 RULES + SUMMARY ROW (DYNAMIC)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: layoutOrder
                              .where((e) =>
                                  e == 'rules' || e == 'summary')
                              .map(
                                (id) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24),
                                    child: draggableSection(id),
                                  ),
                                ),
                              )
                              .toList(),
                        ),

                        const SizedBox(height: 32),

                        /// 🔹 TABLE (FULL WIDTH – DRAGGABLE)
                        draggableSection('table'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
