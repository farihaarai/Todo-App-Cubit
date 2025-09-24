import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:todo_app_cubit/network/rest_client.dart';

final logger = Logger();
final dio = Dio(
  BaseOptions(baseUrl: "http://localhost:8080/api"),
); // Provide a dio instance

final client = AuthRequestRestClient(dio);

void setAuthToken(String token) {
  dio.options.headers["Authorization"] = "Bearer $token";
}
