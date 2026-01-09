import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';

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
                          BoxShadow(color: Colors.black12, blurRadius: 10),
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
                          const Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Enter email to continue',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),

                         Text( 'Email Address', style: theme.textTheme.bodyLarge ?.copyWith(fontWeight: FontWeight.w500), ),
                        const SizedBox(height: 12), TextFormField( controller: controller.emailController, decoration: const InputDecoration( hintText: "example@gmail.com", border: OutlineInputBorder(), ), ), const SizedBox(height: 30),

                          
                          Obx(() => SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : controller.sendOtp,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xFF0A2FB6),
                                  ),
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      :  Text("Submit",
                                      style: AppTextStyles.bodySmall(context).copyWith(
                                        color: Colors.white,
                    ),),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

               
                Expanded(
                  child: Image.asset(
                    'assets/logo/car2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            color: Colors.grey[200],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('© Copyright 2025'),
                Text('Terms & Conditions | Privacy Policy'),
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
