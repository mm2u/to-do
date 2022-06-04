import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '/helpers/constants.dart';

part 'global_state.g.dart';

class GlobalState = _GlobalState with _$GlobalState;

abstract class _GlobalState with Store {

  final boxGeneral = Hive.box(Constants.HIVE_BOX_GENERAL);

  @observable
  DateTime? currentBackPressTime;

  @observable
  bool isInForeground = true;

  @computed
  DateTime? get getCurrentBackPressTime => currentBackPressTime;

  @computed
  bool get getIsInForeground => isInForeground;

  @action
  setCurrentBackPressTime(DateTime value) {
    currentBackPressTime = value;
  }

  @action
  setIsInForeground(bool value) {
    isInForeground = value;
  }

  @action
  show() async {
    // To show a loading indicator.
    await EasyLoading.show();
    await Future.delayed(Duration(milliseconds: 100));
  }

  @action
  dismiss() async {
    // To dismiss a loading indicator.
    await Future.delayed(Duration(milliseconds: 100));
    await EasyLoading.dismiss();
  }

}
