
 
  import 'package:flutter/material.dart';

import 'package:sm_reward_app/features/history/view/history_mobile_view.dart';

class RecentactivityWidget extends StatelessWidget {
  const RecentactivityWidget({super.key});
  @override 
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Activity",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
               ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  MobileHistoryList(),
      ),
    );
  },
  child: const Text("View"),
),

              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("Invoice Id")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Activity Type")),
                  DataColumn(label: Text("Credit Amount")),
                  DataColumn(label: Text("Redeem Amount")),
                  DataColumn(label: Text("Balance")),
                  DataColumn(label: Text("Expiry Date")),
                ],
                rows:   [ _dataRow( "INV-456", "12.08.2025", "Car Service", "10,000", "1000", "9000", "12.08.2026"), _dataRow( "INV-879", "01.08.2025", "Service Labour", "20,000", "2000", "18,000", "01.08.2026"),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
DataRow _dataRow( String invoiceId, String date, String activity, String credit, String redeem, String balance, String expiry, ) { return DataRow( cells: [ DataCell(Text(invoiceId)), DataCell(Text(date)), DataCell(Text(activity)), DataCell(Text(credit)), DataCell(Text(redeem)), DataCell(Text(balance)), DataCell(Text(expiry)), ], ); } 
