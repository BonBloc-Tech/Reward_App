import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/appbar/header.dart';
import 'package:sm_reward_app/features/calculation/widget/invoice_table_widget.dart';
import 'package:sm_reward_app/features/calculation/widget/points_summary_overview_card_widget.dart';
import 'package:sm_reward_app/features/calculation/widget/rules_card_widget.dart';
 import '../controller/calculation_controller.dart';

 
class PointsCalculationPage extends StatelessWidget {
  const PointsCalculationPage({super.key});
 
  @override
  Widget build(BuildContext context) {
 
    // ✅ VERY IMPORTANT: Inject controller here
    Get.put(CalculationController());
 
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: GlobalAppBar(title:   'Points Calculation',),
      body: Row(
        children: [
      
   
         
          
 
                /// 🔹 BODY
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 RULES + SUMMARY
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              /// LEFT – RULES CARD
                              Expanded(
                                flex: 3,
                                child: RulesCard(),
                              ),
 
                              SizedBox(width: 44),
 
                              /// RIGHT – POINTS SUMMARY
                              Expanded(
                                flex: 3,
                                child: PointsSummaryOverviewCard(),
                              ),
                            ],
                          ),
 
                          const SizedBox(height: 28),
 
                          /// 🔹 TABLE TITLE
                          const Text(
                            'Invoice Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
 
                          const SizedBox(height: 16),
 
                          /// 🔹 INVOICE TABLE
                          const InvoiceTable(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
         
    );
  }
}
 
 