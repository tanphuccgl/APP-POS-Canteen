import 'package:canteen/src/features/common/pages/not_found_page.dart';
import 'package:canteen/src/features/dashboard/pages/dashboard_page.dart';
import 'package:canteen/src/features/loading/splash_page.dart';
import 'package:canteen/src/features/login/pages/login_page.dart';
import 'package:canteen/src/features/onboarding/pages/onboarding_page.dart';
import 'package:canteen/src/router/router_name.dart';
import 'package:flutter/material.dart';

class XAppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XRouterName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case XRouterName.signIn:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case XRouterName.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case XRouterName.onboard:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
