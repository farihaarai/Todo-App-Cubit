import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/app_router.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsersCubit()),
        BlocProvider(create: (_) => TodosCubit()..fetchTodos()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // home: LoginScreen(),
        routerConfig: appRouter,
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
          useMaterial3: false,
        ),
      ),
    );
  }
}
