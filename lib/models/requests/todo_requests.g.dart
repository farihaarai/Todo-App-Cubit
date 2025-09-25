// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_requests.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddTodoRequestCWProxy {
  AddTodoRequest description(String description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddTodoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddTodoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AddTodoRequest call({String description});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAddTodoRequest.copyWith(...)` or call `instanceOfAddTodoRequest.copyWith.fieldName(value)` for a single field.
class _$AddTodoRequestCWProxyImpl implements _$AddTodoRequestCWProxy {
  const _$AddTodoRequestCWProxyImpl(this._value);

  final AddTodoRequest _value;

  @override
  AddTodoRequest description(String description) =>
      call(description: description);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddTodoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddTodoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AddTodoRequest call({Object? description = const $CopyWithPlaceholder()}) {
    return AddTodoRequest(
      description:
          description == const $CopyWithPlaceholder() || description == null
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
    );
  }
}

extension $AddTodoRequestCopyWith on AddTodoRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAddTodoRequest.copyWith(...)` or `instanceOfAddTodoRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddTodoRequestCWProxy get copyWith => _$AddTodoRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTodoRequest _$AddTodoRequestFromJson(Map<String, dynamic> json) =>
    AddTodoRequest(description: json['description'] as String);

Map<String, dynamic> _$AddTodoRequestToJson(AddTodoRequest instance) =>
    <String, dynamic>{'description': instance.description};
