import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/view/login_desktop_view.dart';
import 'package:sm_reward_app/features/auth/view/login_mobile_view.dart';
import 'package:sm_reward_app/services/secure_storage_service.dart';

Future<void> logoutBackend() async {
  // Clear session
  await Get.find<SecureStorageService>().logout();

  // Navigate based on platform
  if (kIsWeb || GetPlatform.isDesktop) {
    Get.offAll(() => LoginPage()); // Desktop
  } else {
    Get.offAll(() => LoginPageMobile()); // Mobile
  }
}
