import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '/helpers/colors.dart';
import '/helpers/utils.dart';
import '/helpers/constants.dart';
import '/helpers/enums.dart';

import '/configs/locator.dart';
import '/configs/routes_handler.dart';

import '/models/data_model.dart';

import '/services/navigation_service.dart';

import 'global_state.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {

  final globalState = Provider.of<GlobalState>(locator<NavigationService>().context(), listen: false);

  final titleController = TextEditingController();

  @observable
  DateTime? currentBackPressTime;

  @observable
  TodoListBase? todoListData;

  @observable
  bool keyboardOpened = false;

  @observable
  bool isEditing = false;

  @observable
  ObservableList<TodoListBase> todoList = ObservableList<TodoListBase>.of([]);

  @computed
  DateTime? get getCurrentBackPressTime => currentBackPressTime;

  @computed
  TodoListBase? get getTodoListData => todoListData;

  @computed
  bool get getIsEditing => isEditing;

  @computed
  bool get getKeyboardOpened => keyboardOpened;

  @computed
  ObservableList<TodoListBase> get getTodoList => todoList;

  @action
  setCurrentBackPressTime(DateTime value) {
    currentBackPressTime = value;
  }

  @action
  setTodoListData(TodoListBase? data) {
    todoListData = data;
  }

  @action
  setKeyboardOpened(bool data) {
    keyboardOpened = data;
  }

  @action
  setIsEditing(bool data) {
    isEditing = data;
  }

  @action
  setTodoList(List<TodoListBase> data) {
    todoList = data.asObservable();
  }

  @action
  initBaseData(BaseStore store) async {
    globalState.setBaseStore(store);
  }

  @action
  initDetails() async {
    todoListData ??= TodoListBase();

    var title = getTodoListData?.title ?? '';
    if (getIsEditing) titleController.text = title;
  }

  @action
  disposeDetails() async {
    setTodoListData(null);

    titleController.text = '';
  }

  @action
  showCalenderPicker(BuildContext context, bool isStartedDate) async {
    var startDate = getTodoListData?.startDate;
    var endDate = getTodoListData?.endDate;

    int difference;
    DateTime? min;
    DateTime? max;

    if (isStartedDate) {
      min = DateTime.now();
      max = endDate == null ? DateTime.now().add(Duration(days: 365 * 2)) : DateTime.fromMillisecondsSinceEpoch(endDate).subtract(Duration(days: 1));
      difference = startDate == null ? 0 : DateTime.fromMillisecondsSinceEpoch(startDate).isToday() ? -1 : DateTime.fromMillisecondsSinceEpoch(startDate).difference(DateTime.now()).inDays + 1;
    } else {
      min = DateTime.now().add(Duration(days: 1));
      max = DateTime.now().add(Duration(days: 365 * 2));
      difference = endDate == null ? 0 : DateTime.fromMillisecondsSinceEpoch(endDate).difference(DateTime.now()).inDays + 1;
    }

    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: min,
      maxTime: max,
      theme: DatePickerTheme(
        itemStyle: TextStyle(color: AppColors.BLACK, fontSize: Constants.FONT_18),
        doneStyle: TextStyle(color: AppColors.ORANGE, fontSize: Constants.FONT_20, fontWeight: FontWeight.bold),
        cancelStyle: TextStyle(color: AppColors.GRAY_DARK, fontSize: Constants.FONT_20, fontWeight: FontWeight.bold),
      ),
      onConfirm: (date) {
        print('confirm : $date ${date.millisecondsSinceEpoch}');

        if (isStartedDate) {
          getTodoListData?.startDate = date.millisecondsSinceEpoch;
        } else {
          getTodoListData?.endDate = date.millisecondsSinceEpoch;
        }
      },
      currentTime: DateTime.now().add(Duration(days: difference)), locale: context.deviceLocale.languageCode == Constants.ZH ? LocaleType.zh : LocaleType.en,
    );

  }

  @action
  save() {
    if (getIsEditing) {
      getTodoListData?.title = titleController.text;

      var items = getTodoList.where((element) => element.id == getTodoListData?.id).first;
      items.title = getTodoListData?.title;
      items.startDate = getTodoListData?.startDate;
      items.endDate = getTodoListData?.endDate;
    } else {
      getTodoListData?.id = UniqueKey().hashCode;
      getTodoListData?.title = titleController.text;

      getTodoList.insert(0, getTodoListData!);
    }
    Navigator.of(locator<NavigationService>().context()).pop();
  }

}
