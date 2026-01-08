import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  // ✅ MUST be TextEditingController
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    // For now just print (or navigate)
    debugPrint('Login success');
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }
}
