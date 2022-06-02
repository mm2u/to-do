import 'package:flutter/material.dart';

import '/ui/base/dashboard_page.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<DashboardPageState> dashboardViewKey = GlobalKey<DashboardPageState>();
  final GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateUntil(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  BuildContext context() {
    return navigatorKey.currentContext ?? navigatorKey.currentState!.overlay!.context;
  }

}
