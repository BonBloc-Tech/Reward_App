import 'package:flutter/material.dart';

class PointsSummaryOverviewCard extends StatelessWidget {
  const PointsSummaryOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
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
          /// 🔹 TITLE
          const Text(
            'Points Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 28),

          /// 🔹 MAIN CONTENT
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 DONUT PLACEHOLDER
              _donut(),

              const SizedBox(width: 20),

              /// 🔹 RIGHT DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _totalPoints(),

                    const SizedBox(height: 14),

                    _legendRow(
                      color: const Color(0xFF6EE7B7),
                      title: 'Redeemed Points',
                      value: '6,000 pts',
                      percent: '33.3%',
                    ),

                    const SizedBox(height: 14),

                    _legendRow(
                      color: const Color(0xFF60A5FA),
                      title: 'Available Points',
                      value: '12,000 pts',
                      percent: '66.7%',
                    ),

                    const SizedBox(height: 24),

                    _progressBar(),

                    const SizedBox(height: 24),

                    _expiryAlert(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 DONUT (STATIC UI – chart lib optional later)
  Widget _donut() {
    return Container(
      width: 140,
      height: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [
            Color(0xFF60A5FA),
            Color(0xFF6EE7B7),
          ],
        ),
      ),
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
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 TOTAL TEXT
  Widget _totalPoints() {
    return Row(
      children: const [
        Text(
          'Total Earned Points',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF374151),
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          '18,000 pts',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  /// 🔹 LEGEND ROW
  Widget _legendRow({
    required Color color,
    required String title,
    required String value,
    required String percent,
  }) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '($percent)',
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// 🔹 PROGRESS BAR
  Widget _progressBar() {
    return Column(
      children: [
        Row(
          children: const [
            Text('33.3% Used',
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
            Spacer(),
            Text('66.7% Available',
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Row(
            children: [
              Expanded(
                flex: 33,
                child: Container(height: 8, color: Color(0xFF6EE7B7)),
              ),
              Expanded(
                flex: 67,
                child: Container(height: 8, color: Color(0xFF60A5FA)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 🔹 EXPIRY ALERT
  Widget _expiryAlert() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.notifications, color: Color(0xFFF59E0B), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '1,300 points expiring in next 30 days',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
