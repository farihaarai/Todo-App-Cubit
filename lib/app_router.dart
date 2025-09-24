import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/screens/change_password.dart';
import 'package:todo_app_cubit/screens/edit_profile.dart';
import 'package:todo_app_cubit/screens/login_screen.dart';
import 'package:todo_app_cubit/screens/signup_screen.dart';
import 'package:todo_app_cubit/screens/todo_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/sign-up', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/todos', builder: (context, state) => TodoScreen()),
    GoRoute(
      path: '/change-password',
      builder: (context, state) => ChangePasswordScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) =>
          EditProfileScreen(user: context.read<UsersCubit>().state!),
    ),
  ],
);
