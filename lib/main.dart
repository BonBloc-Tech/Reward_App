import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/routes/app_pages.dart';
import 'package:sm_reward_app/core/routes/app_routes.dart';
import 'package:sm_reward_app/features/auth/view/login_page.dart';

void main() {
  final bool isMobile = Platform.isAndroid || Platform.isIOS;
  runApp(MyApp(isMobile: isMobile));
}

class MyApp extends StatelessWidget {
  final bool isMobile;

  const MyApp({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          isMobile ? AppRoutes.otp1.toName : AppRoutes.login.toName,
          getPages: AppPages.routes,
    );
  }
}
