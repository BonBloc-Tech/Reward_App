import 'package:flutter/material.dart';
import '../model/admin_model.dart';

class VehicleInfoCard extends StatelessWidget {
  final CustomerModel customer;
  const VehicleInfoCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD6E4FF),
        ),
      ),
      child: Column(
        children: [
          /// 🔹 TITLE
          const Text(
            'Associated Vehicle Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 CENTERED CONTENT
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT (LABELS)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Vehicle Reg No',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Model',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),

              /// 🔹 VERTICAL DIVIDER
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 48,
                width: 1,
                color: const Color(0xFFD1D5DB),
              ),

              /// RIGHT (VALUES)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.vehicleNo,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    customer.model,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
