import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/todo.dart';
import 'package:todo_app_cubit/screens/postlogin/change_password.dart';
import 'package:todo_app_cubit/screens/postlogin/edit_profile.dart';
import 'package:todo_app_cubit/screens/postlogin/edit_todo.dart';
import 'package:todo_app_cubit/screens/prelogin/login_screen.dart';
import 'package:todo_app_cubit/screens/prelogin/signup_screen.dart';
import 'package:todo_app_cubit/screens/postlogin/todo_screen.dart';

final GoRouter appRouter = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    final usersCubit = context.read<UsersCubit>();
    final user = usersCubit.state;

    final isPostLoginRoute =
        state.fullPath != null && state.fullPath!.startsWith('/postlogin');

    print(" Current route: ${state.fullPath}");
    print(" User state: $user");

    // If not logged in but trying to access postlogin
    if (user == null && isPostLoginRoute) {
      return '/'; // redirect to login
    }

    if (!isPostLoginRoute && user != null) {
      return "/postlogin/todos";
    }

    // No redirect
    return null;
  },
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/prelogin/sign-up',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/postlogin/todos',
      builder: (context, state) => TodoScreen(),
    ),
    GoRoute(
      path: '/postlogin/change-password',
      builder: (context, state) => ChangePasswordScreen(),
    ),
    GoRoute(
      path: '/postlogin/edit-profile',
      builder: (context, state) =>
          EditProfileScreen(user: context.read<UsersCubit>().state!),
    ),
    GoRoute(
      path: '/postlogin/edit-todo',
      builder: (context, state) {
        final todo = state.extra as Todo;
        return EditTodoScreen(todoId: todo.id, initialText: todo.description);
      },
    ),
  ],
);
