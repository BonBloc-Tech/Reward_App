import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/secure_storage_service.dart';
import 'package:sm_reward_app/services/url/restlet_api.dart';
import 'package:sm_reward_app/routes/app_pages.dart';
import 'package:sm_reward_app/routes/app_routes.dart';

Future<void> main() async {
  
  Get.put(EnvironmentServiceController());

  final envService = Get.find<EnvironmentServiceController>();
  Get.put(RestletApi(envService: envService));
    Get.put(SecureStorageService(), permanent: true);

  final storage = Get.find<SecureStorageService>();
  final bool isLoggedIn = await storage.isLoggedIn();


  final bool isMobile = Platform.isAndroid || Platform.isIOS;

  runApp(MyApp(isMobile: isMobile,isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isMobile;
  final bool isLoggedIn;
  const MyApp({super.key, required this.isMobile,required this.isLoggedIn});

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
