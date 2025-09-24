// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodosStateCWProxy {
  TodosState todos(List<Todo> todos);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TodosState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TodosState(...).copyWith(id: 12, name: "My name")
  /// ```
  TodosState call({List<Todo> todos});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTodosState.copyWith(...)` or call `instanceOfTodosState.copyWith.fieldName(value)` for a single field.
class _$TodosStateCWProxyImpl implements _$TodosStateCWProxy {
  const _$TodosStateCWProxyImpl(this._value);

  final TodosState _value;

  @override
  TodosState todos(List<Todo> todos) => call(todos: todos);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TodosState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TodosState(...).copyWith(id: 12, name: "My name")
  /// ```
  TodosState call({Object? todos = const $CopyWithPlaceholder()}) {
    return TodosState(
      todos: todos == const $CopyWithPlaceholder() || todos == null
          ? _value.todos
          // ignore: cast_nullable_to_non_nullable
          : todos as List<Todo>,
    );
  }
}

extension $TodosStateCopyWith on TodosState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTodosState.copyWith(...)` or `instanceOfTodosState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodosStateCWProxy get copyWith => _$TodosStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosState _$TodosStateFromJson(Map<String, dynamic> json) => TodosState(
  todos:
      (json['todos'] as List<dynamic>?)
          ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TodosStateToJson(TodosState instance) =>
    <String, dynamic>{'todos': instance.todos};
