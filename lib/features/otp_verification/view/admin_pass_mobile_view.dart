import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/nav_menu.dart';
import 'package:sm_reward_app/core/navigation/admin_navbar_mobile.dart';
import 'package:sm_reward_app/features/otp_verification/controller/admin_password.dart';

class AdminPasswordMobileView extends StatelessWidget {
  final String email;

  AdminPasswordMobileView({super.key, required this.email});

  final AdminPasswordController controller =
      Get.put(AdminPasswordController());

  final TextEditingController passwordCtrl = TextEditingController();
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

              const SizedBox(height: 20),

              Text(
                'Admin Login',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                'Enter admin password to continue',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 30),

              TextFormField(
                initialValue: email,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            final pwd = passwordCtrl.text.trim();

                            if (pwd.isEmpty) {
                              Get.snackbar("Error", "Enter password");
                              return;
                            }

                            final success =
                                await controller.verifyAdmin(
                              email: email,
                              password: pwd,
                            );

                            if (success) {
                              Get.offAll(() => const MobileBottomNav1());
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A2FB6),
                      foregroundColor: Colors.white,
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login"),
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
