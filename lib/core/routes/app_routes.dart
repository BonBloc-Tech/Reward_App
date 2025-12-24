enum AppRoutes {
  root,
  login,
  dashboard,
  home,
  otp_verification

}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/", 
    AppRoutes.login: "/LoginPage",
    AppRoutes.dashboard: "/dashboard",
    AppRoutes.home: "/HomeScreen",
    AppRoutes.otp_verification: "/OtpPage",
  };

  String get toName => appRoutes[this]!;
}
