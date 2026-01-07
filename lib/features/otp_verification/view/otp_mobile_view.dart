import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';


class OtpMobileView extends StatelessWidget {
  OtpMobileView({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF5F7FF),
              Color(0xFFEFF1FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  /// OTP CARD
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /// LOGO
                        Center(
                          child: Image.asset(
                            'assets/logo/logo_sm.png',
                            height: 110,
                          ),
                        ),

                        const SizedBox(height: 28),

                        /// TITLE
                        Text(
                          'OTP Verification',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1F2937),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// SUBTITLE
                        Text(
                          'Enter the 4-digit code sent to your email',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF6B7280),
                          ),
                        ),

                        const SizedBox(height: 32),

                        /// OTP INPUT
                        OtpTextField(
                          numberOfFields: 4,
                          fieldWidth: 52,
                          borderRadius: BorderRadius.circular(12),
                          showFieldAsBox: true,
                          filled: true,
                          fillColor: const Color(0xFFF9FAFB),
                          focusedBorderColor:
                              const Color(0xFF4F46E5),
                          enabledBorderColor:
                              const Color(0xFFE5E7EB),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.number,
                          onSubmit: (code) {
                            otpController.text = code;
                          },
                        ),

                        const SizedBox(height: 20),

                        /// RESEND OTP
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive the code?",
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: controller.sendOtp,
                              child: Text(
                                "Resend OTP",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF4F46E5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        /// VERIFY BUTTON
                        SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              if (otpController.text ==
                                  controller.generatedOtp) {
                                Get.offAll(
                                  () => const MobileBottomNav(),
                                );
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Invalid OTP",
                                  snackPosition:
                                      SnackPosition.BOTTOM,
                                  backgroundColor:
                                      Colors.red.shade50,
                                  colorText:
                                      Colors.red.shade700,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF4F46E5),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Verify OTP',
                              style:
                                  theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 94),

                  /// FOOTER
                  Column(
                    children: [
                      Text(
                        '© 2025 All Rights Reserved',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _footerLink(context, 'Terms & Conditions'),
                          const SizedBox(width: 12),
                          const Text('|'),
                          const SizedBox(width: 12),
                          _footerLink(context, 'Privacy Policy'),
                        ],
                      ),
                    ],
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

/// FOOTER LINK
Widget _footerLink(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
          decoration: TextDecoration.underline,
          color: const Color(0xFF4F46E5),
          fontWeight: FontWeight.w500,
        ),
  );
}
