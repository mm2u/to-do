import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '/helpers/constants.dart';

import '/models/data_model.dart';

import 'base_store.dart';

part 'global_state.g.dart';

class GlobalState = _GlobalState with _$GlobalState;

abstract class _GlobalState with Store {

  final boxGeneral = Hive.box(Constants.HIVE_BOX_GENERAL);

  @observable
  BaseStore? baseStore;

  @observable
  bool isInForeground = true;

  @computed
  BaseStore? get getBaseStore => baseStore;

  @computed
  bool get getIsInForeground => isInForeground;

  @action
  setBaseStore(BaseStore? value) {
    baseStore = value;
  }

  @action
  setIsInForeground(bool value) {
    isInForeground = value;
  }

  @action
  show() async {
    await EasyLoading.show();
  }

  @action
  dismiss() async {
    await EasyLoading.dismiss();
  }

}
