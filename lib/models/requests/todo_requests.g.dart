// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_requests.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoRequestCWProxy {
  TodoRequest description(String description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TodoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TodoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  TodoRequest call({String description});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTodoRequest.copyWith(...)` or call `instanceOfTodoRequest.copyWith.fieldName(value)` for a single field.
class _$TodoRequestCWProxyImpl implements _$TodoRequestCWProxy {
  const _$TodoRequestCWProxyImpl(this._value);

  final TodoRequest _value;

  @override
  TodoRequest description(String description) => call(description: description);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TodoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TodoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  TodoRequest call({Object? description = const $CopyWithPlaceholder()}) {
    return TodoRequest(
      description:
          description == const $CopyWithPlaceholder() || description == null
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
    );
  }
}

extension $TodoRequestCopyWith on TodoRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTodoRequest.copyWith(...)` or `instanceOfTodoRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoRequestCWProxy get copyWith => _$TodoRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) =>
    TodoRequest(description: json['description'] as String);

Map<String, dynamic> _$TodoRequestToJson(TodoRequest instance) =>
    <String, dynamic>{'description': instance.description};
