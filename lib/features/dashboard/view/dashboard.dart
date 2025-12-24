import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/view/login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() => LoginPage()); // Navigate back to login page
          },
        ),
        title: const Text("Dashboard"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Dashboard 🎉",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
