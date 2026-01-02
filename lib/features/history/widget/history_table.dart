import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Obx(() {
      if (controller.filteredList.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "No history found.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: const Color(0xFFE6EAF0),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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

              /// DATA ROWS
              for (int i = 0; i < controller.filteredList.length; i++)
                TableRow(
                  decoration: BoxDecoration(
                    color: i.isOdd
                        ? const Color.fromARGB(255, 199, 224, 249)
                        : Colors.white,
                  ),
                  children: [
                    _DataCell(controller.filteredList[i].invoiceId),
                    _DataCell(_formatDate(
                        controller.filteredList[i].date)),
                    _DataCell(controller.filteredList[i].activityType),
                    _DataCell(controller.filteredList[i].credit.toString()),
                    _DataCell(controller.filteredList[i].redeem.toString()),
                    _DataCell(controller.filteredList[i].balance.toString()),
                    _DataCell(_formatDate(
                        controller.filteredList[i].expiryDate)),
                  ],
                ),
            ],
          ),
        ),
      );
    });
  }

  static String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}."
        "${date.month.toString().padLeft(2, '0')}."
        "${date.year}";
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
