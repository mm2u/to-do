// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalState on _GlobalState, Store {
  Computed<BaseStore?>? _$getBaseStoreComputed;

  @override
  BaseStore? get getBaseStore =>
      (_$getBaseStoreComputed ??= Computed<BaseStore?>(() => super.getBaseStore,
              name: '_GlobalState.getBaseStore'))
          .value;
  Computed<bool>? _$getIsInForegroundComputed;

  @override
  bool get getIsInForeground => (_$getIsInForegroundComputed ??= Computed<bool>(
          () => super.getIsInForeground,
          name: '_GlobalState.getIsInForeground'))
      .value;

  late final _$baseStoreAtom =
      Atom(name: '_GlobalState.baseStore', context: context);

  @override
  BaseStore? get baseStore {
    _$baseStoreAtom.reportRead();
    return super.baseStore;
  }

  @override
  set baseStore(BaseStore? value) {
    _$baseStoreAtom.reportWrite(value, super.baseStore, () {
      super.baseStore = value;
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
  dynamic setBaseStore(BaseStore? value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setBaseStore');
    try {
      return super.setBaseStore(value);
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
baseStore: ${baseStore},
isInForeground: ${isInForeground},
getBaseStore: ${getBaseStore},
getIsInForeground: ${getIsInForeground}
    ''';
  }
}
