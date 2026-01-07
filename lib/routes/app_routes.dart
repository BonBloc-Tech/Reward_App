enum AppRoutes {
  root,
  logindesktop,
  loginmobile,
  otpdesktop,
  otpmobile,
  dashboarddesktop,
  dashboardmobile,
  pointsdesktop,
  pointsmobile,
  benefitsdesktop,  
  benefitsmobile,
  pointscalculationdesktop,
  pointscalculationmobile,
  historydesktop,
  historymobile,
  accountdesktop,
  accountmobile, benefits,
  admindesktop,
  adminmobile,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/", 
    AppRoutes.logindesktop: "/",
    AppRoutes.loginmobile: "/loginmobile",
    AppRoutes.otpdesktop: "/otpdesktop",
    AppRoutes.otpmobile: "/otpmobile",
    AppRoutes.dashboarddesktop: "/dashboarddesktop",
    AppRoutes.dashboardmobile: "/dashboardmobile",
    AppRoutes.pointsdesktop: "/pointsdesktop",
    AppRoutes.pointsmobile: "/pointsmobile",
    AppRoutes.benefitsdesktop: "/benefitsdesktop",
    // AppRoutes.benefitsmobile: "/benefitsmobile",
    AppRoutes.pointscalculationdesktop: "/pointscalculationdesktop",
    // AppRoutes.pointsCalculationmobile: "/pointsCalculationmobile",
    AppRoutes.historydesktop: "/historydesktop",
    AppRoutes.historymobile: "/historymobile",
    AppRoutes.accountdesktop: "/accountdesktop",
    AppRoutes.accountmobile: "/accountmobile",
    AppRoutes.benefits: "/benefits",
    AppRoutes.admindesktop: "/ben",
    AppRoutes.adminmobile: "/benefits",
    
  };

  String get toName => appRoutes[this]!;
}
