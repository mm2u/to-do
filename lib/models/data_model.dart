import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'data_model.g.dart';

@JsonSerializable(anyMap: true)
class TodoListBase extends _TodoListBase with _$TodoListBase {

  TodoListBase();

  factory TodoListBase.fromJson(Map<String, dynamic> json) => _$TodoListBaseFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListBaseToJson(this);
}

abstract class _TodoListBase with Store {

  int? id;

  @observable
  int? startDate;

  @observable
  int? endDate;

  // This is for to-do status, true is complete, false is incomplete.
  @observable
  bool checked = false;

  @observable
  String? title;

}
