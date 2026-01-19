import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/snack_bar.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';
import 'package:sm_reward_app/features/otp_verification/controller/otp_controller.dart';
import 'package:sm_reward_app/features/otp_verification/view/admin_pass_desktop_view.dart';

class OtpMobileView extends StatelessWidget {
  final String email;
  final bool isCustomer;
  final bool isAdmin;

  OtpMobileView({
    super.key,
    required this.email,
    required this.isCustomer,
    required this.isAdmin,
  });

  final OtpController controller = Get.put(OtpController());
  final RxString otpValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF5F7FF),
              Color.fromARGB(255, 78, 99, 254),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// MAIN CONTENT
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),

                        /// CARD
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 30, 4, 135)
                                    .withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 1),
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
                                  height: 120,
                                ),
                              ),

                              const SizedBox(height: 32),

                              /// TITLE
                              Text(
                                isAdmin
                                    ? 'Admin Password'
                                    : 'OTP Verification',
                                textAlign: TextAlign.center,
                                style:
                                    theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                'Enter the OTP sent to your email',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall,
                              ),

                              const SizedBox(height: 30),

                              /// OTP FIELD
                              if (isCustomer)
                                OtpTextField(
                                  numberOfFields: 4,
                                  borderColor: Colors.grey,
                                  focusedBorderColor:
                                      const Color(0xFF0A2FB6),
                                  showFieldAsBox: true,
                                  fieldWidth: 50,
                                  onSubmit: (code) {
                                    otpValue.value = code;
                                  },
                                ),

                              const SizedBox(height: 20),

                              
                              TextButton(
                                onPressed: () async {
                                  await controller.resendOtp(email);
                                 AppSnackBar.success(message: 'OTP Sent Successfully'
                                  
                                  );
                                },
                                child: const Text(
                                  "Didn’t receive OTP? Resend",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// VERIFY BUTTON
                              Obx(
                                () => SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed:
                                        controller.isLoading.value ||
                                                otpValue.value.length <
                                                    4
                                            ? null
                                            : () async {
                                                final response =
                                                    await controller
                                                        .verifyOtp(
                                                  email: email,
                                                  otp: otpValue.value,
                                                );

                                                if (response["status"] !=
                                                    "SUCCESS") {
                                                  Get.snackbar(
                                                    "Error",
                                                    "Invalid OTP",
                                                    snackPosition:
                                                        SnackPosition
                                                            .BOTTOM,
                                                  );
                                                  return;
                                                }

                                                if (response["iscustomer"] ==
                                                    true) {
                                                  Get.offAll(() =>
                                                      const MobileBottomNav());
                                                } else if (response[
                                                        "isadmin"] ==
                                                    true) {
                                                  Get.offAll(() =>
                                                      AdminPasswordPage(
                                                          email: email));
                                                }
                                              },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF0A2FB6),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: controller.isLoading.value
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text("Verify OTP"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// FOOTER
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Text(
                      '© 2025 All Rights Reserved',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _footerLink(context, 'Terms & Conditions'),
                        const SizedBox(width: 12),
                        const Text('|',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 12),
                        _footerLink(context, 'Privacy Policy'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            decoration: TextDecoration.underline,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
