enum AppRoutes {
  root,
  login,
  dashboard,  
  otp_verification,
  otp1,
  points,
  benefits,
  pointsCalculation,
  history,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/", 
    AppRoutes.login: "/LoginPage",
    AppRoutes.dashboard: "/DashboardPage",
    AppRoutes.otp_verification: "/OtpPage",

    AppRoutes.otp1: "/OtpMobile", // ✅ 🔥 THIS WAS MISSING

    AppRoutes.points: "/points",
    AppRoutes.benefits: "/benefits",
    AppRoutes.pointsCalculation: "/points-calculation",
    AppRoutes.history: "/history",
  };

  String get toName => appRoutes[this]!;
}
