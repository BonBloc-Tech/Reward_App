import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/controller/login_page_c.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard.dart';

class OtpMobileView extends StatelessWidget {
  const OtpMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/logo/logo_sm.png', height: 120),
              const SizedBox(height: 20),

              const Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                'Enter the OTP sent to your email',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (code) => otpController.text = code,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code? "),
                  GestureDetector(
                    onTap: controller.sendOtp,
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (otpController.text ==
                        controller.generatedOtp) {
                      Get.offAll(() => const DashboardPage());
                    } else {
                      Get.snackbar("Error", "Invalid OTP");
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
