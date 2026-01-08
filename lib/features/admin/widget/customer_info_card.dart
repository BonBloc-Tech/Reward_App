import 'package:flutter/material.dart';
import '../model/admin_model.dart';

class CustomerInfoCard extends StatelessWidget {
  final CustomerModel customer;

  const CustomerInfoCard({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF), // light blue background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 🔹 HEADER (ICON + NAME)
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                customer.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// 🔹 CUSTOMER NUMBER
          _infoRow(
            label: 'Customer No',
            value: customer.customerNo,
          ),

          const SizedBox(height: 8),

          /// 🔹 LAST SERVICE DATE
          _infoRow(
            label: 'Last Service Date',
            value: customer.lastService,
          ),
        ],
      ),
    );
  }

  /// 🔹 Reusable Label–Value Row
  Widget _infoRow({
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
