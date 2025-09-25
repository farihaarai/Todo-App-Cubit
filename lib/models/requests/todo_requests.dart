import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'todo_requests.g.dart';

@JsonSerializable()
@CopyWith()
class TodoRequest {
  final String description;

  TodoRequest({required this.description});

  factory TodoRequest.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TodoRequestToJson(this);
}
