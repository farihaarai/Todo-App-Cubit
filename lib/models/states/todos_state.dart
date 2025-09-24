import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:todo_app_cubit/models/todo.dart';

part 'todos_state.g.dart';

@JsonSerializable()
@CopyWith()
class TodosState {
  final List<Todo> todos;

  TodosState({this.todos = const []});
  factory TodosState.fromJson(Map<String, dynamic> json) =>
      _$TodosStateFromJson(json);

  Map<String, dynamic> toJson() => _$TodosStateToJson(this);
}
