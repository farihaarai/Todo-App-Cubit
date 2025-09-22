import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/models/user.dart';

class UsersCubit extends Cubit<User> {
  UsersCubit() : super(User());

  bool login() {
    return false;
  }

  bool signup() {
    return false;
  }
}
