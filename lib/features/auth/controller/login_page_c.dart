import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController();

  var isOtpSent = false.obs;
  var isLoading = false.obs;

  String generatedOtp = '';

  // ⚠️ TEST ONLY
  final String username = 'crm@the-absol.com';
  final String password = 'absol@2024';

  Future<void> sendOtp() async {
    final email = emailController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Enter valid email");
      return;
    }

    generatedOtp = (100000 + Random().nextInt(900000)).toString();
    isLoading.value = true;

    final smtpServer = SmtpServer(
      'mail.the-absol.com',
      port: 465,
      ssl: true,
      username: username,
      password: password,
    );

    final message = Message()
      ..from = Address(username, 'Reward App')
      ..recipients.add(email)
      ..subject = 'OTP Verification'
      ..text = 'Your OTP is $generatedOtp';

    try {
      await send(message, smtpServer);
      isOtpSent.value = true;
      Get.snackbar("Success", "OTP sent to $email");
    } catch (e) {
      Get.snackbar("Error", "OTP send failed");
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void verifyOtp(String otp) {
    if (otp == generatedOtp) {
      // Get.offAll(() => const DashboardPage());
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}