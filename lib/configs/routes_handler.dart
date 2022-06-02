import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import '/ui/widgets/others_page.dart';
import '/ui/splash/splash_page.dart';
import '/ui/base/dashboard_page.dart';
import '/ui/base/details_page.dart';

import '/helpers/argument.dart';

import '/services/navigation_service.dart';

import 'locator.dart';

class Routes {

  static late FluroRouter router;

  static const String root = '/splash';
  static const String dashboard = '/dashboardView';
  static const String details = '/detailsView';

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: rootHandler);
    router.define(dashboard, handler: dashboardHandler);
    router.define(details, handler: detailsHandler);

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return NotFoundPage();
      },
    );
  }

}

var rootHandler = Handler(
  handlerFunc: (context, params) {
    return const SplashPage();
  },
);

var dashboardHandler = Handler(
  handlerFunc: (context, params) {
    return DashboardPage(key: locator<NavigationService>().dashboardViewKey);
  },
);

var detailsHandler = Handler(
  handlerFunc: (context, params) {
    BaseArguments? args = context!.settings!.arguments == null ? null : context.settings!.arguments as BaseArguments;
    return DetailsPage(arguments: args);
  },
);
