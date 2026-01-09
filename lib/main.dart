import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/url/restlet_api.dart';
import 'package:sm_reward_app/routes/app_pages.dart';
import 'package:sm_reward_app/routes/app_routes.dart';

void main() {
  
  Get.put(EnvironmentServiceController());

  final envService = Get.find<EnvironmentServiceController>();
  Get.put(RestletApi(envService: envService));


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
          isMobile ? AppRoutes.loginmobile.toName : AppRoutes.logindesktop.toName,
      getPages: AppPages.routes,
    );
  }
}
