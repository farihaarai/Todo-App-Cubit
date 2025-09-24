import 'package:flutter/material.dart';

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
                // send updated text back to previous screen
                Navigator.pop(context, {
                  "id": todoId,
                  "description": textController.text.trim(),
                });
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
