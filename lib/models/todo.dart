import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'todo.g.dart';

@JsonSerializable()
@CopyWith()
class Todo {
  final int id;
  final String description;
  final bool isCompleted;

  Todo({required this.id, required this.description, this.isCompleted = false});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
