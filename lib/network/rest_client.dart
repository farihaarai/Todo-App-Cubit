import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';
import 'package:todo_app_cubit/models/requests/todo_requests.dart';
import 'package:todo_app_cubit/models/responses/auth_response.dart';
import 'package:todo_app_cubit/models/todo.dart';
import 'package:todo_app_cubit/models/user.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class AuthRequestRestClient {
  factory AuthRequestRestClient(Dio dio) = _AuthRequestRestClient;

  // ---------- AUTH ----------
  @POST("/login")
  Future<AuthResponse> login(@Body() LoginRequest request);

  // @MultiPart()
  // @POST("/registerUser")
  // Future<AuthResponse> signup(@Body() SignupRequest request);

  @GET("/registerUserGet")
  Future<AuthResponse> signup(
    @Query("name") String name,
    @Query("email") String email,
    @Query("gender") String gender,
    @Query("age") int age,
    @Query("password") String password,
  );

  // ---------- USER -----------
  @GET("/user")
  Future<User> getCurrentUser();

  @PUT("/user/password")
  Future<User> changePassword(@Body() ChangePasswordRequest request);

  @PUT("/user")
  Future<User> updateUserProfile(@Body() UpdateUserRequest request);

  // ---------- TODOS -----------
  @GET('/user/toDo')
  Future<List<Todo>> getUserTodos();

  @POST('/user/toDo')
  Future<Todo> addTodo(@Body() AddTodoRequest request);
}
