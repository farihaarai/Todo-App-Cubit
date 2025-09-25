import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'todo_requests.g.dart';

@JsonSerializable()
@CopyWith()
class AddTodoRequest {
  final String description;

  AddTodoRequest({required this.description});

  factory AddTodoRequest.fromJson(Map<String, dynamic> json) =>
      _$AddTodoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTodoRequestToJson(this);
}
