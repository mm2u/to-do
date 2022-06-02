import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'colors.dart';

void initEastLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.hourGlass
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.none
    ..indicatorSize = 40.0
    ..radius = 8.0
    ..progressColor = AppColors.TRANSPARENT
    ..backgroundColor = AppColors.SILVER
    ..indicatorColor = AppColors.YELLOW
    ..textColor = AppColors.TRANSPARENT
    ..boxShadow = <BoxShadow>[]
    ..userInteractions = false;
}

String? formatTimestamp(int? ms, String fmt) {
  if (ms == null) return null;
  var dateTime = DateTime.fromMillisecondsSinceEpoch(ms);
  var formattedDate = '${DateFormat(fmt).format(dateTime)}';
  return formattedDate;
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return tomorrow.day == day && tomorrow.month == month && tomorrow.year == year;
  }
}
