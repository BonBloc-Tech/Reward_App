import 'package:get/get.dart';

// 🔹 Auth
import 'package:sm_reward_app/features/auth/view/login_page.dart';

// 🔹 Dashboard
import 'package:sm_reward_app/features/dashboard/view/dashboard.dart';

// 🔹 OTP
import 'package:sm_reward_app/features/otp_verification/otp.dart';
import 'package:sm_reward_app/features/otp_verification/view/otp_mobile_view.dart';

// 🔹 Feature Pages
import 'package:sm_reward_app/features/points/view/points_screen.dart';
import 'package:sm_reward_app/features/benefits/view/benefits_page.dart';
import 'package:sm_reward_app/features/calculation/view/points_calculation_page.dart';
import 'package:sm_reward_app/features/history/view/history_page.dart';

// 🔹 Routes
import 'app_routes.dart';

class AppPages {
  static final routes = [

    /// 🔐 Login (Web)
    GetPage(
      name: AppRoutes.login.toName,
      page: () => LoginPage(),
    ),

    /// 🏠 Dashboard
    GetPage(
      name: AppRoutes.dashboard.toName,
      page: () => DashboardPage(),
    ),

    /// 🔢 OTP (Web)
    GetPage(
      name: AppRoutes.otp_verification.toName,
      page: () => OtpPage(),
    ),

    /// 📱 OTP (Mobile)
    GetPage(
      name: AppRoutes.otp1.toName,
      page: () => OtpMobileView(),
    ),

    /// ⭐ Points
    GetPage(
      name: AppRoutes.points.toName,
      page: () => PointsScreen(),
    ),

    /// 🎁 Benefits
    GetPage(
      name: AppRoutes.benefits.toName,
      page: () => BenefitsPage(),
    ),

    /// 🧮 Points Calculation
    GetPage(
      name: AppRoutes.pointsCalculation.toName,
      page: () => PointsCalculationPage(),
    ),

    /// 🕘 History
    GetPage(
      name: AppRoutes.history.toName,
      page: () => HistoryPage(),
    ),
  ];
}
