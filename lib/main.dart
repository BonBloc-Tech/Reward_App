import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/view/login_page.dart';
import 'package:sm_reward_app/features/auth/view/login_pagr_mob.dart';

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
      home: isMobile
          ? LoginPageMobile()
          : LoginPage(),
    );
  }
}
