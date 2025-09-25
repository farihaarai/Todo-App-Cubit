import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/models/requests/todo_requests.dart';
import 'package:todo_app_cubit/models/states/todos_state.dart';
import 'package:todo_app_cubit/models/todo.dart';
import 'package:todo_app_cubit/network/client.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosState(todos: []));

  Future<void> fetchTodos() async {
    try {
      final todos = await client.getUserTodos();
      print("Todos Fetched: $todos");
      emit(TodosState(todos: todos));
    } catch (e) {
      print("Failed to fetch todos: $e");
    }
  }

  Future<void> addTodo(TodoRequest requests) async {
    try {
      final newTodo = await client.addTodo(requests);
      final todos = [...state.todos, newTodo];
      emit(TodosState(todos: todos));
    } catch (e) {
      print("Failed to add todos: $e");
    }
  }

  Future<void> editTodo(int id, TodoRequest requests) async {
    try {
      final updatedTodo = await client.updateTodo(id, requests);
      final updatedTodos = state.todos.map((t) {
        return t.id == id ? updatedTodo : t;
      }).toList();
      emit(TodosState(todos: updatedTodos));
    } catch (e) {
      print("Failed to update todos: $e");
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await client.deletTodo(id);
      final updatedTodos = state.todos.where((t) => t.id != id).toList();
      emit(TodosState(todos: updatedTodos));
    } catch (e) {
      print("Failed to delete todo: $e");
    }
  }

  void toggleTodoCompletion(Todo todo, bool isCompleted) {
    final updatedTodos = state.todos.map((t) {
      if (t.id == todo.id) {
        return t.copyWith(isCompleted: isCompleted);
      }
      return t;
    }).toList();

    emit(TodosState(todos: updatedTodos));
  }
}
