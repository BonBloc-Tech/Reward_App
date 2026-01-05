import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbae_mob.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  /// Controllers
  final nameCtrl = TextEditingController(text: "BHARAT KALRA & CO");
  final emailCtrl = TextEditingController(text: "bharatkalra&co@gmail.com");
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
      body: Row(
        children: [
          const SideMenu(),

          Expanded(
            child: Column(
              children: [
                /// TOP BAR
                _topBar(),

                /// BODY
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _accountForm(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- TOP BAR ----------------
  Widget _topBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 18, color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(
                "BHARAT KALRA & CO",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------- FORM ----------------
  Widget _accountForm() {
    return Column(
      children: [
        _row(
          _field("Name", nameCtrl),
          _field("Email", emailCtrl),
          _field("Mobile", mobileCtrl),
        ),
        const SizedBox(height: 18),
        _row(
          _field("Vehicle No", vehicleCtrl),
          _field("GST", gstCtrl),
          _field("PAN", panCtrl),
        ),
        const SizedBox(height: 18),
        _row(
          _field("Contact Person", contactCtrl),
          _field("Town", townCtrl),
          _field("Terms", termsCtrl),
        ),
        const SizedBox(height: 18),
        _row(
          _field("Registration Type", regTypeCtrl),
          const Spacer(),
          const Spacer(),
        ),
        const SizedBox(height: 18),
        _addressField(),
        const SizedBox(height: 24),

        /// SAVE BUTTON
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       // API call / Save logic here
        //     },
        //     style: ElevatedButton.styleFrom(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        //     ),
        //     child: const Text("Save Changes"),
        //   ),
        // ),
      ],
    );
  }

  Widget _row(Widget a, Widget b, Widget c) {
    return Row(
      children: [
        Expanded(child: a),
        const SizedBox(width: 16),
        Expanded(child: b),
        const SizedBox(width: 16),
        Expanded(child: c),
      ],
    );
  }

  Widget _field(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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
        const Text("Address",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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
}
