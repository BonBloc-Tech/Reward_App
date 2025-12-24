import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sm_reward_app/features/auth/controller/login_page_c.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

  final LoginController controller = Get.put(LoginController());
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// MAIN CONTENT
          Expanded(
            child: Row(
              children: [
                /// LEFT PANEL
                SizedBox(
                  width: 450,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/logo/logo_sm.png',
                          height: 150,
                        ),
                        const SizedBox(height: 10),

                        Text(
                          'OTP Verification',
                          style: theme.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          'Enter the verification code sent to your email.',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),

                        /// OTP FIELD
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.blue,
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {
                            otpController.text = code; // store OTP
                          },
                          onSubmit: (String code) {
                            otpController.text = code;
                          },
                        ),
                        const SizedBox(height: 20),

                        /// RESEND OTP
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive the code? ",
                              style: theme.textTheme.bodySmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.sendOtp(); // Resend OTP
                              },
                              child: Text(
                                "Resend OTP",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        /// SUBMIT BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              String otp = otpController.text.trim();
                              if (otp.isEmpty) {
                                Get.snackbar("Error", "Please enter OTP");
                              } else if (otp == controller.generatedOtp) {
                                // OTP is correct, go to dashboard
                                Get.offAll(() => const DashboardPage());
                              } else {
                                Get.snackbar("Error", "Invalid OTP");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0A2FB6),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// RIGHT PANEL
                Expanded(
                  child: Container(
                    color: Colors.blueGrey,
                    child: Image.asset(
                      'assets/logo/car2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// FOOTER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© Copyright 2025 All Rights Reserved',
                  style: theme.textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Text(
                      'Terms & Conditions',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '|',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Privacy Policy',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
