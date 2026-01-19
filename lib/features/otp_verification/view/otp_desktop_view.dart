import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sm_reward_app/core/global_widgets/snack_bar.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import 'package:sm_reward_app/features/otp_verification/controller/otp_controller.dart';
import 'package:sm_reward_app/features/otp_verification/view/admin_pass_desktop_view.dart';

class OtpPage extends StatelessWidget {
  final String email;
  final bool isCustomer;
  final bool isAdmin;

  OtpPage({
    super.key,
    required this.email,
    required this.isCustomer,
    required this.isAdmin,
  });

  final OtpController controller = Get.put(OtpController());
  final RxString otpValue = ''.obs;
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // ✅ FIX
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Container(
                    width: 450,
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 25),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // ✅ FIX
                          children: [
                            Image.asset('assets/logo/logo_sm.png', height: 100),
                            const SizedBox(height: 20),

                            Text(
                              isAdmin ? 'Admin Password' : 'OTP Verification',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 20),

                          
                            if (isCustomer)
                             OtpTextField(
  numberOfFields: 4,
  borderColor: Colors.grey,
  focusedBorderColor: const Color(0xFF0A2FB6),
  showFieldAsBox: true,
  fieldWidth: 50,
  onSubmit: (code) {
    otpValue.value = code; 
  },
),


                            const SizedBox(height: 20),
                            if (isAdmin)
                              TextField(
                                controller: passwordCtrl,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),

                            const SizedBox(height: 20),
                            
                               
                            TextButton(
                              onPressed: () async {
                                await controller.resendOtp(email);
                               AppSnackBar.success(message: 'OTP Resent Succesfully');
                              },
                            
                              child: const Text( "Didn’t receive OTP? Resend",
                              style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
  const SizedBox(height: 20),
                          
          Obx(() => SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: controller.isLoading.value ||
                otpValue.value.length < 4
            ? null
            : () async {
                final response = await controller.verifyOtp(
                  email: email,
                  otp: otpValue.value,
                );

                if (response["status"] != "SUCCESS") {
                 AppSnackBar.alert(message: 'Invalid Otp');
                  return;
                }

                /// ✅ CUSTOMER FLOW
                if (response["iscustomer"] == true) {
                  Get.offAll(() => const SideMenuLayout());
                }

                /// ✅ ADMIN FLOW
                else if (response["isadmin"] == true) {
                  Get.offAll(() => AdminPasswordPage(email: email));
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A2FB6),
          foregroundColor: Colors.white,
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
            : const Text("Verify OTP"),
      ),
    ))

  
              

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
          ],
        ),
      ),
    );
  }
}
