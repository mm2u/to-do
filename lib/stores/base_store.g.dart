// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  Computed<TodoListBase?>? _$getTodoListDataComputed;

  @override
  TodoListBase? get getTodoListData => (_$getTodoListDataComputed ??=
          Computed<TodoListBase?>(() => super.getTodoListData,
              name: '_BaseStore.getTodoListData'))
      .value;
  Computed<bool>? _$getIsEditingComputed;

  @override
  bool get getIsEditing =>
      (_$getIsEditingComputed ??= Computed<bool>(() => super.getIsEditing,
              name: '_BaseStore.getIsEditing'))
          .value;
  Computed<bool>? _$getIsLoadedHiveComputed;

  @override
  bool get getIsLoadedHive =>
      (_$getIsLoadedHiveComputed ??= Computed<bool>(() => super.getIsLoadedHive,
              name: '_BaseStore.getIsLoadedHive'))
          .value;
  Computed<bool>? _$getKeyboardOpenedComputed;

  @override
  bool get getKeyboardOpened => (_$getKeyboardOpenedComputed ??= Computed<bool>(
          () => super.getKeyboardOpened,
          name: '_BaseStore.getKeyboardOpened'))
      .value;
  Computed<ObservableList<TodoListBase>>? _$getTodoListComputed;

  @override
  ObservableList<TodoListBase> get getTodoList => (_$getTodoListComputed ??=
          Computed<ObservableList<TodoListBase>>(() => super.getTodoList,
              name: '_BaseStore.getTodoList'))
      .value;

  late final _$todoListDataAtom =
      Atom(name: '_BaseStore.todoListData', context: context);

  @override
  TodoListBase? get todoListData {
    _$todoListDataAtom.reportRead();
    return super.todoListData;
  }

  @override
  set todoListData(TodoListBase? value) {
    _$todoListDataAtom.reportWrite(value, super.todoListData, () {
      super.todoListData = value;
    });
  }

  late final _$keyboardOpenedAtom =
      Atom(name: '_BaseStore.keyboardOpened', context: context);

  @override
  bool get keyboardOpened {
    _$keyboardOpenedAtom.reportRead();
    return super.keyboardOpened;
  }

  @override
  set keyboardOpened(bool value) {
    _$keyboardOpenedAtom.reportWrite(value, super.keyboardOpened, () {
      super.keyboardOpened = value;
    });
  }

  late final _$isEditingAtom =
      Atom(name: '_BaseStore.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$isLoadedHiveAtom =
      Atom(name: '_BaseStore.isLoadedHive', context: context);

  @override
  bool get isLoadedHive {
    _$isLoadedHiveAtom.reportRead();
    return super.isLoadedHive;
  }

  @override
  set isLoadedHive(bool value) {
    _$isLoadedHiveAtom.reportWrite(value, super.isLoadedHive, () {
      super.isLoadedHive = value;
    });
  }

  late final _$todoListAtom =
      Atom(name: '_BaseStore.todoList', context: context);

  @override
  ObservableList<TodoListBase> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoListBase> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$initBaseDataAsyncAction =
      AsyncAction('_BaseStore.initBaseData', context: context);

  @override
  Future initBaseData() {
    return _$initBaseDataAsyncAction.run(() => super.initBaseData());
  }

  late final _$initDetailsAsyncAction =
      AsyncAction('_BaseStore.initDetails', context: context);

  @override
  Future initDetails() {
    return _$initDetailsAsyncAction.run(() => super.initDetails());
  }

  late final _$disposeDetailsAsyncAction =
      AsyncAction('_BaseStore.disposeDetails', context: context);

  @override
  Future disposeDetails() {
    return _$disposeDetailsAsyncAction.run(() => super.disposeDetails());
  }

  late final _$hiveGetTodoAsyncAction =
      AsyncAction('_BaseStore.hiveGetTodo', context: context);

  @override
  Future hiveGetTodo() {
    return _$hiveGetTodoAsyncAction.run(() => super.hiveGetTodo());
  }

  late final _$hiveSaveTodoAsyncAction =
      AsyncAction('_BaseStore.hiveSaveTodo', context: context);

  @override
  Future hiveSaveTodo() {
    return _$hiveSaveTodoAsyncAction.run(() => super.hiveSaveTodo());
  }

  late final _$showCalenderPickerAsyncAction =
      AsyncAction('_BaseStore.showCalenderPicker', context: context);

  @override
  Future showCalenderPicker(BuildContext context, CalenderEnum enums) {
    return _$showCalenderPickerAsyncAction
        .run(() => super.showCalenderPicker(context, enums));
  }

  late final _$saveAsyncAction =
      AsyncAction('_BaseStore.save', context: context);

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$updateAsyncAction =
      AsyncAction('_BaseStore.update', context: context);

  @override
  Future update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$_BaseStoreActionController =
      ActionController(name: '_BaseStore', context: context);

  @override
  dynamic setTodoListData(TodoListBase? data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setTodoListData');
    try {
      return super.setTodoListData(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setKeyboardOpened(bool data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setKeyboardOpened');
    try {
      return super.setKeyboardOpened(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsEditing(bool data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setIsEditing');
    try {
      return super.setIsEditing(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadedHive(bool data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setIsLoadedHive');
    try {
      return super.setIsLoadedHive(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTodoList(List<TodoListBase> data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setTodoList');
    try {
      return super.setTodoList(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onBackPressed() {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.onBackPressed');
    try {
      return super.onBackPressed();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoListData: ${todoListData},
keyboardOpened: ${keyboardOpened},
isEditing: ${isEditing},
isLoadedHive: ${isLoadedHive},
todoList: ${todoList},
getTodoListData: ${getTodoListData},
getIsEditing: ${getIsEditing},
getIsLoadedHive: ${getIsLoadedHive},
getKeyboardOpened: ${getKeyboardOpened},
getTodoList: ${getTodoList}
    ''';
  }
}
