// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListBase _$TodoListBaseFromJson(Map json) => TodoListBase()
  ..id = json['id'] as int?
  ..startDate = json['startDate'] as int?
  ..endDate = json['endDate'] as int?
  ..checked = json['checked'] as bool
  ..title = json['title'] as String?;

Map<String, dynamic> _$TodoListBaseToJson(TodoListBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'checked': instance.checked,
      'title': instance.title,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoListBase on _TodoListBase, Store {
  late final _$startDateAtom =
      Atom(name: '_TodoListBase.startDate', context: context);

  @override
  int? get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(int? value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_TodoListBase.endDate', context: context);

  @override
  int? get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(int? value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$checkedAtom =
      Atom(name: '_TodoListBase.checked', context: context);

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$titleAtom = Atom(name: '_TodoListBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  @override
  String toString() {
    return '''
startDate: ${startDate},
endDate: ${endDate},
checked: ${checked},
title: ${title}
    ''';
  }
}
