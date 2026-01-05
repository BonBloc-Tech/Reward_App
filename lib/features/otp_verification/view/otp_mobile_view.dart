import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_mobile_view.dart';

class OtpMobileView extends StatelessWidget {
  OtpMobileView({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final LoginController controller = Get.find<LoginController>();

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
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Logo
                  Image.asset(
                    'assets/logo/logo_sm.png',
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  /// Title
                  const Text(
                    'OTP Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Subtitle
                  const Text(
                    'Enter the OTP sent to your email',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  /// OTP Fields
                  OtpTextField(
                    numberOfFields: 4,
                    showFieldAsBox: true,
                    fieldWidth: 45,
                    borderRadius: BorderRadius.circular(8),
                    textStyle: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    onSubmit: (code) {
                      otpController.text = code;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// Resend OTP
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

                  /// Submit Button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (otpController.text == controller.generatedOtp) {
                          Get.offAll(() => const DashboardMobilePage());
                        } else {
                          Get.snackbar(
                            "Error",
                            "Invalid OTP",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2FB6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
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
