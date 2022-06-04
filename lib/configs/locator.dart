import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '/services/navigation_service.dart';
import '/services/preferences_service.dart';

// This is our global ServiceLocator.
GetIt locator = GetIt.instance;

Future initServiceLocator() async {
  navigation();
  preferences();
}

navigation() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

preferences() {
  locator.registerLazySingleton<PreferencesServiceImpl>(() => PreferencesServiceImpl());
}
