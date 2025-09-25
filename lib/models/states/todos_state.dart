import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:todo_app_cubit/models/todo.dart';

part 'todos_state.g.dart';

@immutable
@JsonSerializable()
@CopyWith()
class TodosState extends Equatable {
  final List<Todo> todos;

  const TodosState({required this.todos});

  factory TodosState.fromJson(Map<String, dynamic> json) =>
      _$TodosStateFromJson(json);

  Map<String, dynamic> toJson() => _$TodosStateToJson(this);

  @override
  List<Object?> get props => [todos];
}
