import 'package:flutter_bloc/flutter_bloc.dart';
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
