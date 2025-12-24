import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/controller/login_page_c.dart';

class LoginPageMobile extends StatelessWidget {
  LoginPageMobile({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// MAIN CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),

                    /// LOGO
                    Center(
                      child: Image.asset(
                        'assets/logo/logo_sm.png',
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// TITLE
                    Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    /// DESCRIPTION
                    Text(
                      'Please enter your email and you will receive an OTP.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 30),

                    /// EMAIL LABEL
                    Text(
                      'Email Address',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),

                    /// EMAIL FIELD
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'example@gmail.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 25),

                    /// SEND OTP BUTTON
                    Obx(
                      () => SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  await controller.sendOtp();
                                  if (controller.isOtpSent.value) {
                                    Get.toNamed('/OtpPage');
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A2FB6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Send OTP',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// FOOTER
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Text(
                    '© 2025 All Rights Reserved',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms & Conditions',
                        style: theme.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('|', style: theme.textTheme.bodySmall),
                      const SizedBox(width: 10),
                      Text(
                        'Privacy Policy',
                        style: theme.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
