// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthResponseCWProxy {
  AuthResponse jwtToken(String jwtToken);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthResponse call({String jwtToken});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthResponse.copyWith(...)` or call `instanceOfAuthResponse.copyWith.fieldName(value)` for a single field.
class _$AuthResponseCWProxyImpl implements _$AuthResponseCWProxy {
  const _$AuthResponseCWProxyImpl(this._value);

  final AuthResponse _value;

  @override
  AuthResponse jwtToken(String jwtToken) => call(jwtToken: jwtToken);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthResponse call({Object? jwtToken = const $CopyWithPlaceholder()}) {
    return AuthResponse(
      jwtToken: jwtToken == const $CopyWithPlaceholder() || jwtToken == null
          ? _value.jwtToken
          // ignore: cast_nullable_to_non_nullable
          : jwtToken as String,
    );
  }
}

extension $AuthResponseCopyWith on AuthResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthResponse.copyWith(...)` or `instanceOfAuthResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthResponseCWProxy get copyWith => _$AuthResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    AuthResponse(jwtToken: json['jwtToken'] as String);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{'jwtToken': instance.jwtToken};
