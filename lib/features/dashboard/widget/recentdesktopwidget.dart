import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';

class RecentActivityDesktopWidget extends StatelessWidget {
  final VoidCallback onViewPressed;

  const RecentActivityDesktopWidget({
    super.key,
    required this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
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

                /// ✅ FIXED & STYLED BUTTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const SideMenuLayout(initialIndex: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5CE7), // button bg
                    foregroundColor: Colors.white, // text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

            /// ✅ VERTICAL + HORIZONTAL SCROLL (SCROLLBAR HIDDEN)
            SizedBox(
              height: 260,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false, // hides scrollbar only
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
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
                          /// HEADER ROW
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

                          /// DATA ROWS
                          for (int i = 0; i < _data.length; i++)
                            TableRow(
                              decoration: BoxDecoration(
                                color: i.isOdd
                                    ? const Color.fromARGB(255, 199, 224, 249)
                                    : Colors.white,
                              ),
                              children: [
                                _DataCell(_data[i][0]),
                                _DataCell(_data[i][1]),
                                _DataCell(_data[i][2]),
                                _DataCell(_data[i][3]),
                                _DataCell(_data[i][4]),
                                _DataCell(_data[i][5]),
                                _DataCell(_data[i][6]),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

/// SAMPLE DATA
final List<List<String>> _data = [
  ["INV-456", "12.08.2025", "Car Service", "10,000", "1,000", "9,000", "12.08.2026"],
  ["INV-879", "01.08.2025", "Service Labour", "20,000", "2,000", "18,000", "01.08.2026"],
  ["INV-987", "22.07.2025", "Full Car Service", "8,000", "800", "7,200", "22.07.2026"],
  ["INV-932", "15.07.2025", "Engine Oil Purchase", "7,000", "700", "6,300", "15.07.2026"],
  ["INV-111", "05.07.2025", "Wheel Alignment", "3,000", "300", "2,700", "05.07.2026"],
];
