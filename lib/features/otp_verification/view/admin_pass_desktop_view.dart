import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/nav_menu.dart';
import 'package:sm_reward_app/features/otp_verification/controller/admin_password.dart';



class AdminPasswordPage extends StatelessWidget {
  final String email;

  AdminPasswordPage({super.key, required this.email});

  final AdminPasswordController controller =
      Get.put(AdminPasswordController());

  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                /// LEFT PANEL
                Container(
                  width: 450,
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 25),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/logo/logo_sm.png',
                            height: 120,
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Admin Login',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 10),
                          Text(
                            'Enter admin password to continue',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          const SizedBox(height: 30),

                          /// EMAIL (READ ONLY)
                          TextFormField(
                            initialValue: email,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// PASSWORD
                          TextFormField(
                            controller: passwordCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// VERIFY BUTTON
                          Obx(() => SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : () async {
                                          final pwd =
                                              passwordCtrl.text.trim();

                                          if (pwd.isEmpty) {
                                            Get.snackbar(
                                                "Error", "Enter password");
                                            return;
                                          }

                                          final success =
                                              await controller.verifyAdmin(
                                            email: email,
                                            password: pwd,
                                          );

                                          if (success) {
                                            
                                            Get.offAll(() =>
                                                const NavMenuLayout(
                                                  
                                                ));
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
                                      : const Text("Login"),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                /// RIGHT IMAGE
                Expanded(
                  child: Image.asset(
                    'assets/logo/car2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          /// FOOTER
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            color: Colors.grey[200],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('© Copyright 2025 All Rights Reserved'),
                Text('Terms & Conditions | Privacy Policy'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
