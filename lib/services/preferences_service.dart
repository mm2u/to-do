import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '/helpers/constants.dart';

abstract class PreferencesService {

  Future<String> getLocale();
  Future<void> setLocale(String a);

}

class PreferencesServiceImpl implements PreferencesService {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Future<String> getLocale() async {
    final SharedPreferences pref = await prefs;
    pref.reload();
    return pref.getString(Constants.LOCALE) ?? Constants.EN;
  }

  @override
  Future<void> setLocale(String a) async {
    final SharedPreferences pref = await prefs;
    pref.setString(Constants.LOCALE, a);
  }

}
