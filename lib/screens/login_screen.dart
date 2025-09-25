import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';
import 'package:todo_app_cubit/models/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController(
    text: "fariha@g.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "1234",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<UsersCubit, User?>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    final user = await context.read<UsersCubit>().login(
                      LoginRequest(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
                    if (user != null) {
                      context.go('/todos');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid email or password"),
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    context.go('/sign-up');
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
