import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';
import 'package:todo_app_cubit/models/user.dart';
import 'package:todo_app_cubit/network/client.dart';

class UsersCubit extends Cubit<User?> {
  String token = '';

  UsersCubit() : super(null);

  // LOGIN
  Future<User?> login(TodosCubit todosCubit, LoginRequest requests) async {
    try {
      final response = await client.login(requests);
      token = response.jwtToken;
      setAuthToken(token);
      final user = await getUser();
      if (user != null) {
        await todosCubit.fetchTodos();
      }
      return user;
    } catch (e) {
      print("Login failed: $e");
      return null;
    }
  }

  // SIGNUP
  Future<User?> signup(SignupRequest requests) async {
    try {
      final response = await client.signup(
        requests.name,
        requests.email,
        requests.gender,
        requests.age,
        requests.password,
      );
      token = response.jwtToken;
      setAuthToken(token);
      final user = await getUser();
      return user;
    } catch (e) {
      print("Signup failed: $e");
      return null;
    }
  }

  // FETCH CURRENT USER
  Future<User?> getUser() async {
    try {
      final user = await client.getCurrentUser();
      emit(user);
      return user;
    } catch (e) {
      print("Fetch user failed: $e");
      return null;
    }
  }

  Future<bool> changePassword(ChangePasswordRequest requests) async {
    try {
      final user = await client.changePassword(requests);
      emit(user);
      return true;
    } catch (e) {
      print("Passowrd not changed: $e");
      return false;
    }
  }

  Future<bool> updateUserProfile(UpdateUserRequest requests) async {
    try {
      final user = await client.updateUserProfile(requests);
      emit(user);
      return true;
    } catch (e) {
      print("User updatation failed: $e");
      return false;
    }
  }

  void logout() {
    token = '';
    setAuthToken('');
    emit(null);
  }
}
