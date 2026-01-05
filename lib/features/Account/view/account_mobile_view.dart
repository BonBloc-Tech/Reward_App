import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/appbar/appbar_mob.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';



class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),
          body: Row(
            children: [
              if (isDesktop) const MobileBottomNav(),

              Expanded(
                child: Column(
                  children: [
                     const MobileAppBar(title: "Dashboard"),
                   
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: _accountForm(isDesktop),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ---------------- FORM ----------------
  Widget _accountForm(bool isDesktop) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _responsiveRow(isDesktop, [
            _field("Name", nameCtrl),
            _field("Email", emailCtrl),
            _field("Mobile", mobileCtrl),
          ]),
          _gap(),

          _responsiveRow(isDesktop, [
            _field("Vehicle No", vehicleCtrl),
            _field("GST", gstCtrl),
            _field("PAN", panCtrl),
          ]),
          _gap(),

          _responsiveRow(isDesktop, [
            _field("Contact Person", contactCtrl),
            _field("Town", townCtrl),
            _field("Terms", termsCtrl),
          ]),
          _gap(),

          _responsiveRow(isDesktop, [
            _field("Registration Type", regTypeCtrl),
          ]),
          _gap(),

          _addressField(),
          const SizedBox(height: 24),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Save Changes"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _responsiveRow(bool isDesktop, List<Widget> fields) {
    if (!isDesktop) {
      return Column(
        children: fields
            .map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: f,
                ))
            .toList(),
      );
    }

    return Row(
      children: fields
          .map((f) => Expanded(child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: f,
              )))
          .toList(),
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

  Widget _gap() => const SizedBox(height: 18);
}
