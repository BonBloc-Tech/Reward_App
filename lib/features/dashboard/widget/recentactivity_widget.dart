
 
  import 'package:flutter/material.dart';

import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';

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
        padding: const EdgeInsets.all(14),
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

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const MobileBottomNav(initialIndex: 2),
                      ),
                    );
                  },
                  child: const Text(
                    "View",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// TABLE (SCROLLABLE)
            SizedBox(
              height: 220, // 👈 important for mobile
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 16,
                  headingRowHeight: 42,
                  dataRowHeight: 44,
                  columns: const [
                    DataColumn(label: Text("Invoice")),
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("Activity")),
                    DataColumn(label: Text("Credit")),
                    DataColumn(label: Text("Redeem")),
                    DataColumn(label: Text("Balance")),
                    DataColumn(label: Text("Expiry")),
                  ],
                  rows: [
                    _dataRow("INV-456", "12.08.25", "Car Service", "10,000",
                        "1,000", "9,000", "12.08.26"),
                    _dataRow("INV-879", "01.08.25", "Labour", "20,000",
                        "2,000", "18,000", "01.08.26"),
                    _dataRow("INV-987", "22.07.25", "Full Service", "8,000",
                        "800", "7,200", "22.07.26"),
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

DataRow _dataRow( String invoiceId, String date, String activity, String credit, String redeem, String balance, String expiry, ) { return DataRow( cells: [ DataCell(Text(invoiceId)), DataCell(Text(date)), DataCell(Text(activity)), DataCell(Text(credit)), DataCell(Text(redeem)), DataCell(Text(balance)), DataCell(Text(expiry)), ], ); } 
