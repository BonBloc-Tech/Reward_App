import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculation_controller.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalculationController>();

    return Obx(() {
      if (controller.invoices.isEmpty) {
        return const Center(child: Text('No invoice data'));
      }

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // ✅ Horizontal scroll for table
          child: Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width - 300, // Adjust for side menu
            ),
            child: Table(
              border: TableBorder.all(
                color: const Color(0xFFE5E7EB),
                width: 1,
                borderRadius: BorderRadius.circular(8),
              ),
              columnWidths: const {
                0: FixedColumnWidth(160), // Invoice ID
                1: FixedColumnWidth(160), // Amount
                2: FixedColumnWidth(160), // Earned Points
                3: FixedColumnWidth(180), // Max Redeem Allowed
                4: FixedColumnWidth(160), // Redeemed Points
                5: FixedColumnWidth(160), // Remaining Points
                6: FixedColumnWidth(160), // Expiry Date
              },
              children: [
                /// HEADER ROW
                TableRow(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  children: [
                    _HeaderCell('Invoice ID'),
                    _HeaderCell('Invoice Amount'),
                    _HeaderCell('Earned Points'),
                    _HeaderCell('Max Redeem Allowed(10%)'),
                    _HeaderCell('Redeemed Points'),
                    _HeaderCell('Remaining Points'),
                    _HeaderCell('Expiry Date'),
                  ],
                ),

                /// DATA ROWS
                for (int i = 0; i < controller.invoices.length; i++)
                  TableRow(
                    decoration: BoxDecoration(
                      color: i.isEven
                          ? Colors.white
                          : const Color.fromARGB(255, 199, 224, 249),
                    ),
                    children: [
                      _DataCell(controller.invoices[i].invoiceId),
                      _DataCell('₹${controller.invoices[i].amount}'),
                      _DataCell('${controller.invoices[i].earned} pts'),
                      _DataCell('${controller.invoices[i].maxRedeem} pts'),
                      _DataCell('${controller.invoices[i].redeemed} pts'),
                      _DataCell('${controller.invoices[i].remaining} pts'),
                      _DataCell(controller.invoices[i].expiry),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

/// HEADER CELL
class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF333333),
        ),
      ),
    );
  }
}