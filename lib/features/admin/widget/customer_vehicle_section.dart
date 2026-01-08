import 'package:flutter/material.dart';
import '../model/admin_model.dart';
import 'customer_info_card.dart';
import 'vehicle_info_card.dart';

class CustomerVehicleSection extends StatelessWidget {
  final CustomerModel customer;

  const CustomerVehicleSection({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 CUSTOMER INFO CARD
        Expanded(
          flex: 1,
          child: CustomerInfoCard(customer: customer),
        ),

        const SizedBox(width: 20),

        /// 🔹 VEHICLE INFO CARD
        Expanded(
          flex: 1,
          child: VehicleInfoCard(customer: customer),
        ),
      ],
    );
  }
}
