import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '/services/navigation_service.dart';
import '/services/preferences_service.dart';

GetIt locator = GetIt.instance;

Future initLocator() async {
  navigation();
  preferences();
}

navigation() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

preferences() {
  locator.registerLazySingleton<PreferencesServiceImpl>(() => PreferencesServiceImpl());
}
