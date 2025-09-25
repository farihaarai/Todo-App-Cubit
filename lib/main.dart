import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/app.dart';
import 'package:todo_app_cubit/app_observer.dart';
import 'package:todo_app_cubit/models/todo.dart';

void main() {
  Bloc.observer = const AppObserver();
  runApp(const TodoApp());

  // var todo1 = Todo(id: 1, description: "abc", isCompleted: true);
  // var todo2 = Todo(id: 1, description: "abc", isCompleted: true);
  // print(todo1 == todo2);
}
