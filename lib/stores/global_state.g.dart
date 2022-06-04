// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalState on _GlobalState, Store {
  Computed<DateTime?>? _$getCurrentBackPressTimeComputed;

  @override
  DateTime? get getCurrentBackPressTime =>
      (_$getCurrentBackPressTimeComputed ??= Computed<DateTime?>(
              () => super.getCurrentBackPressTime,
              name: '_GlobalState.getCurrentBackPressTime'))
          .value;
  Computed<bool>? _$getIsInForegroundComputed;

  @override
  bool get getIsInForeground => (_$getIsInForegroundComputed ??= Computed<bool>(
          () => super.getIsInForeground,
          name: '_GlobalState.getIsInForeground'))
      .value;

  late final _$currentBackPressTimeAtom =
      Atom(name: '_GlobalState.currentBackPressTime', context: context);

  @override
  DateTime? get currentBackPressTime {
    _$currentBackPressTimeAtom.reportRead();
    return super.currentBackPressTime;
  }

  @override
  set currentBackPressTime(DateTime? value) {
    _$currentBackPressTimeAtom.reportWrite(value, super.currentBackPressTime,
        () {
      super.currentBackPressTime = value;
    });
  }

  late final _$isInForegroundAtom =
      Atom(name: '_GlobalState.isInForeground', context: context);

  @override
  bool get isInForeground {
    _$isInForegroundAtom.reportRead();
    return super.isInForeground;
  }

  @override
  set isInForeground(bool value) {
    _$isInForegroundAtom.reportWrite(value, super.isInForeground, () {
      super.isInForeground = value;
    });
  }

  late final _$showAsyncAction =
      AsyncAction('_GlobalState.show', context: context);

  @override
  Future show() {
    return _$showAsyncAction.run(() => super.show());
  }

  late final _$dismissAsyncAction =
      AsyncAction('_GlobalState.dismiss', context: context);

  @override
  Future dismiss() {
    return _$dismissAsyncAction.run(() => super.dismiss());
  }

  late final _$_GlobalStateActionController =
      ActionController(name: '_GlobalState', context: context);

  @override
  dynamic setCurrentBackPressTime(DateTime value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setCurrentBackPressTime');
    try {
      return super.setCurrentBackPressTime(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsInForeground(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setIsInForeground');
    try {
      return super.setIsInForeground(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentBackPressTime: ${currentBackPressTime},
isInForeground: ${isInForeground},
getCurrentBackPressTime: ${getCurrentBackPressTime},
getIsInForeground: ${getIsInForeground}
    ''';
  }
}
