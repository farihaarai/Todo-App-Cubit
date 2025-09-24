import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
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
                // Example: context.read<UsersCubit>().logout();
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
                      "👋 Welcome, ${user.name}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text("📧 ${user.email}"),
                    Text("🎂 Age: ${user.age}"),
                    Text("⚧ Gender: ${user.gender}"),
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
                ElevatedButton(
                  onPressed: () {
                    final todo = _textController.text.trim();
                    if (todo.isNotEmpty) {
                      // TODO: add todo to cubit
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Added: $todo')));
                      _textController.clear();
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Todo List
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.check_box_outline_blank),
                      title: Text("Todo item #$index"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // TODO: remove todo
                        },
                      ),
                    ),
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
