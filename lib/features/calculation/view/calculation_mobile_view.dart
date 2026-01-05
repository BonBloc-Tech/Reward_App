import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';

import '../controller/calculation_controller.dart';
import '../widget/invoice_table_widget.dart';


class PointsCalculationScreenMobile extends StatelessWidget {
  const PointsCalculationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalculationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Points Calculation",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile_logo.png'),
            ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ✅ MOBILE SAFE RULES CARD (FULL CONTENT)
            const MobileRulesCard(),

            const SizedBox(height: 24),

            /// ✅ MOBILE SAFE POINTS SUMMARY
            _mobilePointsSummary(),

            const SizedBox(height: 32),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Invoice Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(height: 16),
            const InvoiceTable(),
          ],
        ),
      ),


      bottomNavigationBar: const SideNavbarMobile()
    );
  }

  // =========================================================
  // ✅ POINTS SUMMARY (UNCHANGED – WORKING FINE)
  // =========================================================
  Widget _mobilePointsSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Points Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Center(child: _donut()),
          const SizedBox(height: 24),
          _totalPoints(),
          const SizedBox(height: 16),
          _legendRow(
            color: Color(0xFF6EE7B7),
            title: 'Redeemed Points',
            value: '6,000 pts',
            percent: '33.3%',
          ),
          const SizedBox(height: 12),
          _legendRow(
            color: Color(0xFF60A5FA),
            title: 'Available Points',
            value: '12,000 pts',
            percent: '66.7%',
          ),
          const SizedBox(height: 20),
          _progressBar(),
          const SizedBox(height: 20),
          _expiryAlert(),
        ],
      ),
    );
  }

  Widget _donut() {
    return Container(
      width: 140,
      height: 140,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [Color(0xFF60A5FA), Color(0xFF6EE7B7)],
        ),
      ),
      child: Center(
        child: Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '18,000\npts',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }

  Widget _totalPoints() {
    return Row(
      children: const [
        Text("Total Earned Points"),
        Spacer(),
        Text("18,000 pts",
            style: TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _legendRow({
    required Color color,
    required String title,
    required String value,
    required String percent,
  }) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        const SizedBox(width: 8),
        Expanded(child: Text(title)),
        Text(value),
        const SizedBox(width: 6),
        Text("($percent)", style: TextStyle(color: color)),
      ],
    );
  }

  Widget _progressBar() {
    return Column(
      children: [
        Row(
          children: const [
            Text("33.3% Used"),
            Spacer(),
            Text("66.7% Available"),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Row(
            children: [
              Expanded(
                  flex: 33,
                  child: Container(height: 8, color: Color(0xFF6EE7B7))),
              Expanded(
                  flex: 67,
                  child: Container(height: 8, color: Color(0xFF60A5FA))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _expiryAlert() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.notifications,
              color: Color(0xFFF59E0B), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '1,300 points expiring in next 30 days',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// ✅ MOBILE SAFE RULES CARD (YOUR FULL CONTENT)
//////////////////////////////////////////////////////////////

class MobileRulesCard extends StatelessWidget {
  const MobileRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Points are calculated based on invoice value.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          /// EARN RULE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F8FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Earn Rule:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Service > ₹1,000 → 100 pts per ₹1,000\n'
                  'Accessories > ₹5,000 → 100 pts per ₹1,000',
                  style: TextStyle(fontSize: 12, height: 1.9),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Redeem Rule:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),

          const Text(
            'Maximum redeemable = 10% of invoice value\n'
            'Points expire 1 year after earn date.\n'
            'Oldest points are consumed first.',
            style: TextStyle(fontSize: 12, height: 1.9),
          ),
        ],
      ),
    );
  }
}
