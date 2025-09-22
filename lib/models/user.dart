import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class User {
  final String email;
  final String password;
  final String name;
  final int age;
  final String gender;

  User({
    this.email = '',
    this.password = '',
    this.name = '',
    this.age = 0,
    this.gender = 'f',
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
