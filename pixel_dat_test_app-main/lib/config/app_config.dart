import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/auth/screens/log_in_screen.dart';
import 'package:pixel_dat_test_app/auth/screens/onboarding_screen.dart';
import 'package:pixel_dat_test_app/auth/screens/sign_up_screen.dart';
import 'package:pixel_dat_test_app/auth/screens/splash_screen.dart';
import 'package:pixel_dat_test_app/home/home_screen.dart';

class AppRouter {
  static var router;

  static Route onGenerateRoute(RouteSettings settings) {
    // print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}