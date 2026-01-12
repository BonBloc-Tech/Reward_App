import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/appbar/header_mobile.dart';

class AccountPageMobile extends StatefulWidget {
  const AccountPageMobile({super.key});

  @override
  State<AccountPageMobile> createState() => _AccountPageMobileState();
}

class _AccountPageMobileState extends State<AccountPageMobile> {
  final nameCtrl = TextEditingController(text: "BHARAT KALRA & CO");
  final emailCtrl =
      TextEditingController(text: "bharatkalra&co@gmail.com");
  final mobileCtrl = TextEditingController(text: "9876543210");

  final vehicleCtrl = TextEditingController(text: "TN 06 MB 9995");
  final gstCtrl = TextEditingController(text: "33ABCDE1234F1Z5");
  final panCtrl = TextEditingController(text: "ABCDE1234F");

  final contactCtrl = TextEditingController(text: "Bharat Kalra & Co");
  final townCtrl = TextEditingController(text: "Chennai");
  final termsCtrl = TextEditingController(text: "90 days");

  final regTypeCtrl = TextEditingController(text: "Registered");
  final addressCtrl = TextEditingController(
    text: "17A,\nChennai GP Road,\nChennai, Tamil Nadu - 610001",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      /// ✅ GLOBAL APP BAR WITH BACK ARROW
      appBar: const GlobalAppBarMobile(
        title: "Account",
        showBack: true, // 👈 back arrow only here
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: _accountForm(),
        ),
      ),
    );
  }

  /// ---------------- FORM ----------------
  Widget _accountForm() {
    return Column(
      children: [
        _field("Name", nameCtrl),
        _gap(),
        _field("Email", emailCtrl),
        _gap(),
        _field("Mobile", mobileCtrl),
        _gap(),

        _field("Vehicle No", vehicleCtrl),
        _gap(),
        _field("GST", gstCtrl),
        _gap(),
        _field("PAN", panCtrl),
        _gap(),

        _field("Contact Person", contactCtrl),
        _gap(),
        _field("Town", townCtrl),
        _gap(),
        _field("Terms", termsCtrl),
        _gap(),

        _field("Registration Type", regTypeCtrl),
        _gap(),

        _addressField(),
        const SizedBox(height: 24),

        // Optional save button
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     child: const Text("Save Changes"),
        //   ),
        // ),
      ],
    );
  }

  Widget _field(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F6FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _addressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Address",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: addressCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F6FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _gap() => const SizedBox(height: 18);
}
