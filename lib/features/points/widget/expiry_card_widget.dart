import 'package:flutter/material.dart';

class ExpiryCard extends StatelessWidget {
  const ExpiryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Expiry Date",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Valid for 1 year from redeem date"),
            Divider(height: 24),
            Text("Ways to Earn Points"),
            SizedBox(height: 6),
            Text("• Service your vehicle"),
            Text("• Purchase spare parts"),
          ],
        ),
      ),
    );
  }
}
