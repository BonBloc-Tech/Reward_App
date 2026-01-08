import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/history/view/history_mobile_view.dart';

class RecentactivityWidget extends StatelessWidget {
  const RecentactivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// HEADER ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Activity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// ✅ VIEW BUTTON (COLORED)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileHistoryList(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF7C3AED), // text color
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFFE6EAF0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "View",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// TABLE
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFE6EAF0),
                  ),
                ),
                child: Table(
                  border: TableBorder.symmetric(
                    inside: const BorderSide(
                      color: Color(0xFFE6EAF0),
                    ),
                  ),
                  columnWidths: const {
                    0: FixedColumnWidth(160),
                    1: FixedColumnWidth(140),
                    2: FixedColumnWidth(230),
                    3: FixedColumnWidth(160),
                    4: FixedColumnWidth(160),
                    5: FixedColumnWidth(140),
                    6: FixedColumnWidth(160),
                  },
                  children: [
                    /// HEADER
                    const TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F7FA),
                      ),
                      children: [
                        _HeaderCell("Invoice ID"),
                        _HeaderCell("Date"),
                        _HeaderCell("Activity Type"),
                        _HeaderCell("Credit Amount"),
                        _HeaderCell("Redeem Amount"),
                        _HeaderCell("Balance"),
                        _HeaderCell("Expiry Date"),
                      ],
                    ),

                    /// ROW 1
                    _dataRow(
                      index: 0,
                      invoiceId: "INV-456",
                      date: "12.08.2025",
                      activity: "Car Service",
                      credit: "10,000",
                      redeem: "1,000",
                      balance: "9,000",
                      expiry: "12.08.2026",
                    ),

                    /// ROW 2
                    _dataRow(
                      index: 1,
                      invoiceId: "INV-879",
                      date: "01.08.2025",
                      activity: "Service Labour",
                      credit: "20,000",
                      redeem: "2,000",
                      balance: "18,000",
                      expiry: "01.08.2026",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ROW BUILDER
TableRow _dataRow({
  required int index,
  required String invoiceId,
  required String date,
  required String activity,
  required String credit,
  required String redeem,
  required String balance,
  required String expiry,
}) {
  return TableRow(
    decoration: BoxDecoration(
      color: index.isOdd
          ? const Color.fromARGB(255, 199, 224, 249)
          : Colors.white,
    ),
    children: [
      _DataCell(invoiceId),
      _DataCell(date),
      _DataCell(activity),
      _DataCell(credit),
      _DataCell(redeem),
      _DataCell(balance),
      _DataCell(expiry),
    ],
  );
}

/// HEADER CELL
class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// DATA CELL
class _DataCell extends StatelessWidget {
  final String text;
  const _DataCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}
