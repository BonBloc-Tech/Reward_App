import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_mob.dart';

class OtpMobileView extends StatelessWidget {
  const OtpMobileView({super.key});

  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);
    final LoginController controller = Get.find();
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo/logo_sm.png', height: 120),
                  const SizedBox(height: 20),

                  const Text(
                    'OTP Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    'Enter the OTP sent to your email',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
OtpTextField(
  numberOfFields: 4,
  showFieldAsBox: true,
  fieldWidth: 45, // width of each box
  borderRadius: BorderRadius.circular(8),
  textStyle: const TextStyle(fontSize: 20),
  margin: const EdgeInsets.symmetric(horizontal: 8), // spacing between boxes
  keyboardType: TextInputType.number,
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
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (otpController.text == controller.generatedOtp) {
                          Get.offAll(() => const DashboardMobilePage());
                        } else {
                          Get.snackbar("Error", "Invalid OTP");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2FB6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Submit',  style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500,color: Colors.white)  ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
