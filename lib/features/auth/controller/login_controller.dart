import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/otp_verification/view/admin_pass_desktop_view.dart';
import 'package:sm_reward_app/features/otp_verification/view/otp_desktop_view.dart';
import 'package:sm_reward_app/features/otp_verification/view/otp_mobile_view.dart';
import 'package:sm_reward_app/features/otp_verification/view/admin_pass_mobile_view.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/url/restlet_api.dart';
 
class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final RxBool isLoading = false.obs;
  late final RestletApi _restletService;
  late final EnvironmentServiceController envService;
  @override
  void onInit() {
    super.onInit();
    envService = Get.put(
      EnvironmentServiceController(),
      permanent: true,

    );
 
    _restletService = Get.put(
      RestletApi(envService: envService),
      permanent: true,
    );

  }
 
  Future<void> sendOtp() async {
   final email = emailController.text.trim();
     if (email.isEmpty) {
      Get.snackbar("Error", "Please enter email");
      return;
    } 
    try {
      isLoading.value = true; 
      final response = await _restletService.fetchReportData(
        envService.getScriptId('getEmail'),
        {"email": email},
      ); 
      debugPrint("OTP RESPONSE: $response"); 
      if (response["status"] == "SUCCESS") {
        Get.snackbar("Success", response["message"]); 
        final bool isAdmin = response["isadmin"] == true;
        final bool isCustomer = response["iscustomer"] == true;
        final bool isDesktop = GetPlatform.isDesktop; 
          if (isAdmin) {
          if (isDesktop) {
            Get.offAll(() => AdminPasswordPage(email: email));
          } else {
            Get.offAll(() => AdminPasswordMobileView(email: email));

          }
          return;
        } 
        if (isCustomer) {
          if (isDesktop) {
            Get.offAll(() => OtpPage(
                  email: email,
                  isCustomer: true,
                  isAdmin: false,
                ));
          } else {
            Get.offAll(() => OtpMobileView(
                  email: email,
                  isCustomer: true,
                  isAdmin: false,
                ));
          }
          return;
        } 
        Get.snackbar("Error", "User type not identified");
      } else {
        Get.snackbar("Error", response["message"] ?? "OTP failed");
      }
    } catch (e) {
      debugPrint("SEND OTP ERROR: $e");
      Get.snackbar("Error", "Something went wrong");

    } finally {
      isLoading.value = false;
    }
  } 
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

}

 