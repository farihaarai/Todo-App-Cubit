import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/todo_requests.dart';
import 'package:todo_app_cubit/models/states/todos_state.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 108, 199),
        elevation: 0,
        centerTitle: true, //  center title
        title: const Text(
          "Todo App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'edit_profile') {
                context.go('/postlogin/edit-profile');
              } else if (value == 'change_password') {
                context.go('/postlogin/change-password');
              } else if (value == 'logout') {
                context.read<UsersCubit>().logout();
                context.go('/');
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'edit_profile', child: Text('Edit Profile')),
              PopupMenuItem(
                value: 'change_password',
                child: Text('Change Password'),
              ),
              PopupMenuItem(value: 'logout', child: Text('Logout')),
            ],
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D83F2), Color(0xFF8EA9F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420), // stops stretch
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _addTodoFeild(context),
                    // Input row
                    const SizedBox(height: 20),

                    // Todo List
                    _todoList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addTodoFeild(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Type a new todo here',
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            final todo = _textController.text.trim();
            if (todo.isNotEmpty) {
              context.read<TodosCubit>().addTodo(
                TodoRequest(description: todo),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Added: $todo')));
              _textController.clear();
            }
          },
          icon: const Icon(Icons.add),
          label: const Text("Add"),
        ),
      ],
    );
  }

  Widget _todoList() {
    return Expanded(
      child: BlocBuilder<TodosCubit, TodosState>(
        builder: (BuildContext context, TodosState state) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Text(
                "No todos found",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    activeColor: Colors.deepPurple,
                    value: todo.isCompleted ?? false,
                    onChanged: (val) {
                      if (val != null) {
                        context.read<TodosCubit>().toggleTodoCompletion(
                          todo,
                          val,
                        );
                      }
                    },
                  ),
                  title: Text(
                    todo.description,
                    style: TextStyle(
                      fontSize: 16,
                      decoration: (todo.isCompleted ?? false)
                          ? TextDecoration.lineThrough
                          : null,
                      color: (todo.isCompleted ?? false)
                          ? Colors.grey
                          : Colors.black87,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.go('/edit-todo', extra: todo);
                        },
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                      ),
                      IconButton(
                        onPressed: (todo.isCompleted ?? false)
                            ? () {
                                context.read<TodosCubit>().deleteTodo(todo.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Deleted: ${todo.description}',
                                    ),
                                  ),
                                );
                              }
                            : null, // disabled when not completed
                        icon: Icon(
                          Icons.delete,
                          color: (todo.isCompleted ?? false)
                              ? Colors.redAccent
                              : Colors.grey, //greyed out when disabled
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
