import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import 'package:sm_reward_app/features/calculation/widget/invoice_table_widget.dart';
import 'package:sm_reward_app/features/calculation/widget/summary_cards_row_widget.dart';



class PointsCalculationPage extends StatelessWidget {
  const PointsCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Row(
        children: [
          /// 🔹 SIDE MENU
          const SideMenu(),

          /// 🔹 MAIN AREA
          Expanded(
            child: Column(
              children: [
                /// 🔹 TOP HEADER (STATIC)
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
                    children: [
                      /// 🔹 LEFT LOGO
                      

                      const SizedBox(width: 16),

                      /// 🔹 PAGE TITLE
                      const Text(
                        'Points Calculation Page',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      const Spacer(),

                      /// 🔹 PROFILE SECTION
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/profile_logo.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'BHARAT KALRA & CO',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// 🔹 SCROLLABLE CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 DESCRIPTION
                          const Text(
                            'Points are calculated based on invoice value.',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 14),

                          /// 🔹 RULES CARD
                          Container(
                            width: 420,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Earn Rule:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '• Services > ₹1,000 → 100 pts per ₹1,000\n'
                                  '• Accessories > ₹5,000 → 100 pts per ₹1,000',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF4B5563),
                                    height: 1.6,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Redeem Rule:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '• Max redeemable = 10% of invoice value\n'
                                  '• Points expire after 1 year\n'
                                  '• Oldest points used first',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF4B5563),
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 22),

                          /// 🔹 SUMMARY CARDS
                          const SummaryCardsRow(),

                          const SizedBox(height: 22),

                          /// 🔹 TABLE TITLE
                          const Text(
                            'Invoice Details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// 🔹 TABLE
                          const InvoiceTable(),
                        ],
                      ),
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