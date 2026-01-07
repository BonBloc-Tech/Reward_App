import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
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
          children: [
            Text(
              'Invoice Details',
              style: AppTextStyles.titleSmall(context),
            ),
            const SizedBox(height: 16),
            const InvoiceTable(),
          ],
        );
 
      default:
        return const SizedBox();
    }
  }
 
  Widget draggableSection(String id) {
    return DragTarget<String>(
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
          
          Expanded(
            child: Column(
              children: [
                const GlobalAppBar(
                  title: 'Points Calculation',
                ),
 
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: layoutOrder
                              .where((e) =>
                                  e == 'rules' || e == 'summary')
                              .map(
                                (id) => Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(right: 24),
                                    child: draggableSection(id),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
 
                        const SizedBox(height: 32),
                       
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
 
 