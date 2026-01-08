// import 'package:flutter/material.dart';
// import '../model/customer_model.dart';

// class CustomerVehicleCards extends StatelessWidget {
//   final CustomerModel customer;

//   const CustomerVehicleCards({super.key, required this.customer});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         _card(
//           title: customer.name,
//           left1: "Customer No",
//           right1: customer.customerNo,
//           left2: "Last Service Date",
//           right2: customer.lastServiceDate,
//         ),
//         const SizedBox(width: 16),
//         _card(
//           title: "Associated Vehicle Details",
//           left1: "Vehicle Reg No",
//           right1: "TN09AB1234",
//           left2: "Model",
//           right2: "Mercedes-Benz C-Class",
//         ),
//       ],
//     );
//   }

//   Widget _card({
//     required String title,
//     required String left1,
//     required String right1,
//     required String left2,
//     required String right2,
//   }) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEFF6FF),
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//             const SizedBox(height: 12),
//             _row(left1, right1),
//             const SizedBox(height: 8),
//             _row(left2, right2),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _row(String l, String r) {
//     return Row(
//       children: [
//         Expanded(child: Text(l, style: const TextStyle(color: Colors.grey))),
//         Expanded(child: Text(r)),
//       ],
//     );
//   }
// }
