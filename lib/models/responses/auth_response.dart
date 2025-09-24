import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'auth_response.g.dart';

@JsonSerializable()
@CopyWith()
class AuthResponse {
  final String jwtToken;
  AuthResponse({required this.jwtToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
