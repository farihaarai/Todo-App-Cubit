import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/todo_requests.dart';
import 'package:todo_app_cubit/models/states/todos_state.dart';
import 'package:todo_app_cubit/models/user.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit_profile') {
                context.go('/edit-profile');
              } else if (value == 'change_password') {
                context.go('/change-password');
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  User Info
            BlocBuilder<UsersCubit, User?>(
              builder: (context, user) {
                if (user == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Welcome, ${user.name}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(" ${user.email}"),
                    Text(" Age: ${user.age}"),
                    Text(" Gender: ${user.gender}"),
                    const Divider(height: 30),
                  ],
                );
              },
            ),

            // Todo Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Type a new todo here',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                BlocBuilder<TodosCubit, TodosState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        final todo = _textController.text.trim();
                        if (todo.isNotEmpty) {
                          context.read<TodosCubit>().addTodo(
                            TodoRequest(description: todo),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added: $todo')),
                          );
                          _textController.clear();
                        }
                      },
                      child: const Text("Add"),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Todo List
            Expanded(
              child: BlocBuilder<TodosCubit, TodosState>(
                // buildWhen: (previous, current) {
                //   bool rebuild = (previous == current);
                //   print("Rebuild? : $rebuild");
                //   return rebuild;
                // },
                builder: (BuildContext context, TodosState state) {
                  print("In Builder: ${state.todos.length}");
                  if (state.todos.isEmpty) {
                    return const Center(child: Text("No todos found"));
                  }
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
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
                          title: Text(todo.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go('/edit-todo');
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // final todoId = todo.id;
                                  context.read<TodosCubit>().deleteTodo(
                                    todo.id,
                                  );

                                  // Optional: show a snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Deleted: ${todo.description}',
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
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
            ),
          ],
        ),
      ),
    );
  }
}
