import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';
import 'package:sm_reward_app/features/otp_verification/otp.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                        /// LOGO
                        Image.asset(
                          'assets/logo/logo_sm.png',
                          height: 150,
                        ),
                        const SizedBox(height: 10),

                        /// TITLE
                        Text(
                          'Login',
                          style: theme.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),

                        /// DESCRIPTION
                        Text(
                          'Please enter your Email and you will receive an OTP.',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),

                        Text(
                          'Email Address',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),

                        /// EMAIL FIELD
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                             controller: controller.emailController,
                            decoration: const InputDecoration(
                              hintText: "example@gmail.com",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        /// BUTTON
                       Obx(() => SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () async {
                await controller.sendOtp(); // wait for OTP to send
               if (controller.isOtpSent.value) {
                                          Get.to(
                                            OtpPage(),
                                          );
                                        }
                                      },
              
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A2FB6),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: controller.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text('Send OTP'),
      ),
    )),

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
