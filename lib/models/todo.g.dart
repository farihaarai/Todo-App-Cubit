// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoCWProxy {
  Todo id(int id);

  Todo description(String description);

  Todo isCompleted(bool? isCompleted);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Todo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ```
  Todo call({int id, String description, bool? isCompleted});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTodo.copyWith(...)` or call `instanceOfTodo.copyWith.fieldName(value)` for a single field.
class _$TodoCWProxyImpl implements _$TodoCWProxy {
  const _$TodoCWProxyImpl(this._value);

  final Todo _value;

  @override
  Todo id(int id) => call(id: id);

  @override
  Todo description(String description) => call(description: description);

  @override
  Todo isCompleted(bool? isCompleted) => call(isCompleted: isCompleted);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Todo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ```
  Todo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
  }) {
    return Todo(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      description:
          description == const $CopyWithPlaceholder() || description == null
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      isCompleted: isCompleted == const $CopyWithPlaceholder()
          ? _value.isCompleted
          // ignore: cast_nullable_to_non_nullable
          : isCompleted as bool?,
    );
  }
}

extension $TodoCopyWith on Todo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTodo.copyWith(...)` or `instanceOfTodo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoCWProxy get copyWith => _$TodoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  isCompleted: json['isCompleted'] as bool?,
);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'id': instance.id,
  'description': instance.description,
  'isCompleted': instance.isCompleted,
};
