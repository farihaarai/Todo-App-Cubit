import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'todo.g.dart';

@immutable
@JsonSerializable()
@CopyWith()
class Todo extends Equatable {
  final int id;
  final String description;
  final bool? isCompleted;

  const Todo({required this.id, required this.description, this.isCompleted});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  List<Object?> get props => [id, description, isCompleted];
}
