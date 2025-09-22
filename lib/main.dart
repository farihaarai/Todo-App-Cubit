import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/app.dart';
import 'package:todo_app_cubit/app_observer.dart';

void main() {
  Bloc.observer = const AppObserver();
  runApp(const TodoApp());
}
