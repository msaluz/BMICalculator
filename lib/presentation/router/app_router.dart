import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:bmi_calculator/presentation/screens/bmi_screen.dart';
import 'package:bmi_calculator/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/history_screen.dart';
import '../screens/overview_screen.dart';
import '../screens/result_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.bmiScreen:
        return MaterialPageRoute(builder: (_) => const BmiScreen());
      case Routes.resultScreen:
        return MaterialPageRoute(builder: (_) => const BmiResultScreen());
      case Routes.overviewScreen:
        return MaterialPageRoute(builder: (_) => const BmiOverviewScreen());
      case Routes.historyScreen:
        return MaterialPageRoute(builder: (_) => const BmiHistory());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
