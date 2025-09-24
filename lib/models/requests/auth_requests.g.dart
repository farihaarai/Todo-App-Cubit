// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_requests.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginRequestCWProxy {
  LoginRequest email(String email);

  LoginRequest password(String password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginRequest call({String email, String password});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLoginRequest.copyWith(...)` or call `instanceOfLoginRequest.copyWith.fieldName(value)` for a single field.
class _$LoginRequestCWProxyImpl implements _$LoginRequestCWProxy {
  const _$LoginRequestCWProxyImpl(this._value);

  final LoginRequest _value;

  @override
  LoginRequest email(String email) => call(email: email);

  @override
  LoginRequest password(String password) => call(password: password);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return LoginRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $LoginRequestCopyWith on LoginRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLoginRequest.copyWith(...)` or `instanceOfLoginRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginRequestCWProxy get copyWith => _$LoginRequestCWProxyImpl(this);
}

abstract class _$SignupRequestCWProxy {
  SignupRequest email(String email);

  SignupRequest password(String password);

  SignupRequest name(String name);

  SignupRequest age(int age);

  SignupRequest gender(String gender);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SignupRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SignupRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SignupRequest call({
    String email,
    String password,
    String name,
    int age,
    String gender,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSignupRequest.copyWith(...)` or call `instanceOfSignupRequest.copyWith.fieldName(value)` for a single field.
class _$SignupRequestCWProxyImpl implements _$SignupRequestCWProxy {
  const _$SignupRequestCWProxyImpl(this._value);

  final SignupRequest _value;

  @override
  SignupRequest email(String email) => call(email: email);

  @override
  SignupRequest password(String password) => call(password: password);

  @override
  SignupRequest name(String name) => call(name: name);

  @override
  SignupRequest age(int age) => call(age: age);

  @override
  SignupRequest gender(String gender) => call(gender: gender);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SignupRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SignupRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SignupRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
  }) {
    return SignupRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      age: age == const $CopyWithPlaceholder() || age == null
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as int,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String,
    );
  }
}

extension $SignupRequestCopyWith on SignupRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSignupRequest.copyWith(...)` or `instanceOfSignupRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignupRequestCWProxy get copyWith => _$SignupRequestCWProxyImpl(this);
}

abstract class _$ChangePasswordRequestCWProxy {
  ChangePasswordRequest currentPassword(String currentPassword);

  ChangePasswordRequest newPassword(String newPassword);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChangePasswordRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChangePasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ChangePasswordRequest call({String currentPassword, String newPassword});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChangePasswordRequest.copyWith(...)` or call `instanceOfChangePasswordRequest.copyWith.fieldName(value)` for a single field.
class _$ChangePasswordRequestCWProxyImpl
    implements _$ChangePasswordRequestCWProxy {
  const _$ChangePasswordRequestCWProxyImpl(this._value);

  final ChangePasswordRequest _value;

  @override
  ChangePasswordRequest currentPassword(String currentPassword) =>
      call(currentPassword: currentPassword);

  @override
  ChangePasswordRequest newPassword(String newPassword) =>
      call(newPassword: newPassword);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChangePasswordRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChangePasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ChangePasswordRequest call({
    Object? currentPassword = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
  }) {
    return ChangePasswordRequest(
      currentPassword:
          currentPassword == const $CopyWithPlaceholder() ||
              currentPassword == null
          ? _value.currentPassword
          // ignore: cast_nullable_to_non_nullable
          : currentPassword as String,
      newPassword:
          newPassword == const $CopyWithPlaceholder() || newPassword == null
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String,
    );
  }
}

extension $ChangePasswordRequestCopyWith on ChangePasswordRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChangePasswordRequest.copyWith(...)` or `instanceOfChangePasswordRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangePasswordRequestCWProxy get copyWith =>
      _$ChangePasswordRequestCWProxyImpl(this);
}

abstract class _$UpdateUserRequestCWProxy {
  UpdateUserRequest name(String name);

  UpdateUserRequest gender(String gender);

  UpdateUserRequest age(int age);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateUserRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateUserRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateUserRequest call({String name, String gender, int age});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateUserRequest.copyWith(...)` or call `instanceOfUpdateUserRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateUserRequestCWProxyImpl implements _$UpdateUserRequestCWProxy {
  const _$UpdateUserRequestCWProxyImpl(this._value);

  final UpdateUserRequest _value;

  @override
  UpdateUserRequest name(String name) => call(name: name);

  @override
  UpdateUserRequest gender(String gender) => call(gender: gender);

  @override
  UpdateUserRequest age(int age) => call(age: age);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateUserRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateUserRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateUserRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
  }) {
    return UpdateUserRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String,
      age: age == const $CopyWithPlaceholder() || age == null
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as int,
    );
  }
}

extension $UpdateUserRequestCopyWith on UpdateUserRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateUserRequest.copyWith(...)` or `instanceOfUpdateUserRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateUserRequestCWProxy get copyWith =>
      _$UpdateUserRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
    };

ChangePasswordRequest _$ChangePasswordRequestFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequest(
  currentPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestToJson(
  ChangePasswordRequest instance,
) => <String, dynamic>{
  'currentPassword': instance.currentPassword,
  'newPassword': instance.newPassword,
};

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
    };
