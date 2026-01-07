
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sm_reward_app/features/Account/view/account_desktop_view.dart';
import 'package:sm_reward_app/features/Account/view/account_mobile_view.dart';
import 'package:sm_reward_app/features/auth/view/login_desktop_view.dart';
import 'package:sm_reward_app/features/auth/view/login_mobile_view.dart';
import 'package:sm_reward_app/features/benefits/view/benefits_desktop_view.dart';
import 'package:sm_reward_app/features/calculation/view/calculation_desktop_view.dart';
import 'package:sm_reward_app/features/calculation/view/calculation_mobile_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_mobile_view.dart';
import 'package:sm_reward_app/features/history/view/history_desktop_view.dart';
import 'package:sm_reward_app/features/otp_verification/view/otp_desktop_view.dart';
import 'package:sm_reward_app/features/otp_verification/view/otp_mobile_view.dart';
import 'package:sm_reward_app/features/points/view/points_desktop_view.dart';
import 'package:sm_reward_app/features/points/view/points_mobile_view.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [

  
    GetPage(
      name: AppRoutes.logindesktop.toName,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.loginmobile.toName,
      page: () => LoginPageMobile(),
    ),
   GetPage(
      name: AppRoutes.otpdesktop.toName,
      page: () => OtpPage(),
    ), 
    GetPage(
      name: AppRoutes.otpmobile.toName,
      page: () => OtpMobileView(),
    ),   
    GetPage(
      name: AppRoutes.dashboarddesktop.toName,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: AppRoutes.dashboardmobile.toName,
      page: () => DashboardMobilePage(),
    ),
   GetPage(
      name: AppRoutes.pointsdesktop.toName,
      page: () => PointsScreen(),
    ),
      GetPage(
      name: AppRoutes.pointsmobile.toName,
      page: () => PointsCalculationScreenMobile(),
    ),
    GetPage(
      name: AppRoutes.benefitsdesktop.toName,
      page: () => BenefitsDesktopView(),
    ),
    GetPage(
      name: AppRoutes.pointsmobile.toName,
      page: () => PointsScreenMobile(),
    ),
     GetPage(
      name: AppRoutes.pointscalculationdesktop.toName,
      page: () => PointsCalculationPage(),
    ),

    GetPage(
      name: AppRoutes.historydesktop.toName,
      page: () => HistoryPage(),
    ),
     GetPage(
      name: AppRoutes.historymobile.toName,
      page: () => HistoryPage(),
    ),
     GetPage(
      name: AppRoutes.accountdesktop.toName,
      page: () => AccountPage(),
    ),
     GetPage(
      name: AppRoutes.accountmobile.toName,
      page: () => AccountPageMobile(),
    ),
    
  ];
}
