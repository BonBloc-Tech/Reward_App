import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbae_mob.dart';

import '../controller/calculation_controller.dart';
import '../widget/summary_cards_row_mobile_widget.dart';
import '../widget/invoice_table_widget.dart';

class PointsCalculationPageMobile extends StatefulWidget {
  const PointsCalculationPageMobile({super.key});

  @override
  State<PointsCalculationPageMobile> createState() =>
      _PointsCalculationPageMobileState();
}

class _PointsCalculationPageMobileState
    extends State<PointsCalculationPageMobile> {
  /// ✅ Register controller
  final CalculationController controller =
      Get.put(CalculationController());

  /// 🔹 Widgets order list
  late List<Widget> sections;

  @override
  void initState() {
    super.initState();

    sections = [
      _description(),
      _rulesCard(),
      const SummaryCardsRowMobile(),
      _invoiceTitle(),
      const InvoiceTable(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      /// 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          'Points Calculation',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFE5E7EB),
              child: Icon(Icons.person_outline, size: 18),
            ),
          ),
        ],
      ),

      /// 🔹 DRAG & DROP BODY
      body: ReorderableListView(
        padding: const EdgeInsets.all(16),
        buildDefaultDragHandles: true,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = sections.removeAt(oldIndex);
            sections.insert(newIndex, item);
          });
        },
        children: [
          for (int i = 0; i < sections.length; i++)
            Container(
              key: ValueKey(i),
              margin: const EdgeInsets.only(bottom: 16),
              child: sections[i],
            ),
        ],
      ),

      /// ✅ CORRECT PLACE
      bottomNavigationBar: const Side_Menu(),
    );
  }

  /// 🔹 DESCRIPTION
  Widget _description() {
    return const Text(
      'Points are calculated based on invoice value.',
      style: TextStyle(
        fontSize: 13,
        color: Color(0xFF6B7280),
      ),
    );
  }

  /// 🔹 RULES CARD
  Widget _rulesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earn Rule:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Text(
            '• Services > ₹1,000 → 100 pts per ₹1,000\n'
            '• Accessories > ₹5,000 → 100 pts per ₹1,000',
            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
          ),
          SizedBox(height: 14),
          Text(
            'Redeem Rule:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Text(
            '• Max redeemable = 10% of invoice value\n'
            '• Points expire after 1 year\n'
            '• Oldest points used first',
            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }

  /// 🔹 INVOICE TITLE
  Widget _invoiceTitle() {
    return const Text(
      'Invoice Details',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
