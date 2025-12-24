import 'package:get/get.dart';
import 'package:sm_reward_app/features/auth/view/login_page.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard.dart';
import 'package:sm_reward_app/features/otp_verification/otp.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login.toName,      // ✅ FIX
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.dashboard.toName,  // ✅ FIX
      page: () => DashboardPage(),
    ),
    GetPage(
      name: AppRoutes.otp_verification.toName,  // ✅ FIX
      page: () => OtpPage(),
    ),
  ];
}
