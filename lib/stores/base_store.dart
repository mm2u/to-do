import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '/helpers/enums.dart';
import '/helpers/colors.dart';
import '/helpers/utils.dart';
import '/helpers/constants.dart';

import '/configs/locator.dart';

import '/models/data_model.dart';

import '/services/navigation_service.dart';

import 'global_state.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {

  final globalState = Provider.of<GlobalState>(locator<NavigationService>().context(), listen: false);

  final titleController = TextEditingController();

  @observable
  TodoListBase? todoListData;

  @observable
  bool keyboardOpened = false;

  @observable
  bool isEditing = false;

  @observable
  bool isLoadedHive = false;

  @observable
  ObservableList<TodoListBase> todoList = ObservableList<TodoListBase>.of([]);

  @computed
  TodoListBase? get getTodoListData => todoListData;

  @computed
  bool get getIsEditing => isEditing;

  @computed
  bool get getIsLoadedHive => isLoadedHive;

  @computed
  bool get getKeyboardOpened => keyboardOpened;

  @computed
  ObservableList<TodoListBase> get getTodoList => todoList;

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
  setIsLoadedHive(bool data) {
    isLoadedHive = data;
  }

  @action
  setTodoList(List<TodoListBase> data) {
    todoList = data.asObservable();
  }

  @action
  initBaseData() async {
    await globalState.show();
    await hiveGetTodo();
    await globalState.dismiss();
  }

  @action
  initDetails() async {
    todoListData ??= TodoListBase();

    // To set the data to text field controller.
    var title = getTodoListData?.title ?? '';
    if (getIsEditing) titleController.text = title;
  }

  @action
  disposeDetails() async {
    setTodoListData(null);

    // To clear text field controller.
    titleController.text = '';
  }

  @action
  hiveGetTodo() async {
    // To retrieve saved data from Hive database.
    var json = await globalState.boxGeneral.get(Constants.HIVE_TO_DO);
    if (json != null && json.isNotEmpty) {
      var dd = jsonDecode(json) as List;
      var list = dd.map((item) => TodoListBase.fromJson(item)).toList();
      setTodoList(list);
    }

    setIsLoadedHive(true);
  }

  @action
  hiveSaveTodo() async {
    // To save data into Hive database.
    await globalState.boxGeneral.put(Constants.HIVE_TO_DO, jsonEncode(getTodoList));
  }

  @action
  showCalenderPicker(BuildContext context, CalenderEnum enums) async {
    var startDate = getTodoListData?.startDate;
    var endDate = getTodoListData?.endDate;

    // To preset the current datetime in calender for the editing.
    int difference = 0;

    // To preset the default maximum day in show calender.
    int maxYears = 365 * 2;

    // To defined min date can be selected in the calender.
    DateTime? min;

    // To defined max date can be selected in the calender.
    DateTime? max;

    if (enums == CalenderEnum.STARTED) {
      min = DateTime.now();
      // User cannot select end date with the same start date, here you need to subtract 1 day from the end date.
      max = endDate == null ? DateTime.now().add(Duration(days: maxYears)) : DateTime.fromMillisecondsSinceEpoch(endDate).subtract(Duration(days: 1));
      difference = startDate == null ? 0 : DateTime.fromMillisecondsSinceEpoch(startDate).isToday() ? -1 : DateTime.fromMillisecondsSinceEpoch(startDate).difference(DateTime.now()).inDays + 1;
    } else if (enums == CalenderEnum.ENDED) {
      // User cannot select start date with the same end date, here you need to add 1 day from the start date.
      min = startDate == null ? DateTime.now().add(Duration(days: 1)) : DateTime.fromMillisecondsSinceEpoch(startDate).add(Duration(days: 1));
      max = startDate == null ? DateTime.now().add(Duration(days: maxYears)) : DateTime.fromMillisecondsSinceEpoch(startDate).add(Duration(days: maxYears));
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
        // Save datetime as milliseconds.
        if (enums == CalenderEnum.STARTED) {
          getTodoListData?.startDate = date.millisecondsSinceEpoch;
        } else if (enums == CalenderEnum.ENDED) {
          getTodoListData?.endDate = date.millisecondsSinceEpoch;
        }
      },
      currentTime: DateTime.now().add(Duration(days: difference)), locale: isChinese(context) ? LocaleType.zh : LocaleType.en,
    );

  }

  @action
  save() async {
    if (getIsEditing) {
      getTodoListData?.title = titleController.text;

      // To get the to-do items by its id.
      var items = getTodoList.where((element) => element.id == getTodoListData?.id).first;
      items.title = getTodoListData?.title;
      items.startDate = getTodoListData?.startDate;
      items.endDate = getTodoListData?.endDate;
    } else {
      // To generate unique id for the list items.
      getTodoListData?.id = UniqueKey().hashCode;
      getTodoListData?.title = titleController.text;

      getTodoList.insert(0, getTodoListData!);
    }

    await hiveSaveTodo();

    Navigator.of(locator<NavigationService>().context()).pop();
  }

  @action
  update() async {
    await globalState.show();
    await hiveSaveTodo();
    await globalState.dismiss();
  }

  @action
  onBackPressed() {
    DateTime? now = DateTime.now();
    DateTime? pressTime = globalState.getCurrentBackPressTime;

    // Check press time if within 2 seconds will exit app, otherwise show a toast message.
    bool tap = pressTime == null ? true : now.difference(pressTime) > Duration(seconds: 2);
    if (tap) {
      BotToast.showText(text: 'ExitAppDesc'.tr());
      globalState.setCurrentBackPressTime(now);
      return false;
    }
    return true;
  }

}
