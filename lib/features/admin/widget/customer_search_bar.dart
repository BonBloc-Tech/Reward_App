import 'package:flutter/material.dart';
import 'searchable_customer_dropdown.dart';

class CustomerSearchBar extends StatelessWidget {
  final List<String> customers;
  const CustomerSearchBar({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 🔹 DROPDOWN
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD1D5DB)),
            ),
            child: SearchableCustomerDropdown(items: customers),
          ),
        ),

        const SizedBox(width: 14),

        /// 🔹 SEARCH BUTTON
        SizedBox(
          height: 48,
          width: 110,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Search",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
