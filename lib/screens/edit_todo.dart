import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
import 'package:todo_app_cubit/models/requests/todo_requests.dart';

class EditTodoScreen extends StatelessWidget {
  EditTodoScreen({super.key, required this.initialText, required this.todoId});

  final String initialText;
  final int todoId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController(
      text: initialText,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Todo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: "Update todo"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newText = textController.text.trim();
                if (newText.isNotEmpty) {
                  context.read<TodosCubit>().editTodo(
                    todoId,
                    TodoRequest(description: newText),
                  );
                }
                context.go('/todos');
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
