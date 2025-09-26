import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/todos_cubit.dart';
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
    TodosCubit todosCubit = BlocProvider.of<TodosCubit>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D83F2), Color(0xFF8EA9F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600, //  control the card width
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlocBuilder<UsersCubit, User?>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Welcome Back 👋",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Login to continue",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Email
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Password
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async {
                                  final user = await context
                                      .read<UsersCubit>()
                                      .login(
                                        todosCubit,
                                        LoginRequest(
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        ),
                                      );
                                  if (!context.mounted) return;
                                  if (user != null) {
                                    context.go('/postlogin/todos');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Invalid email or password",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextButton(
                              onPressed: () {
                                context.go('/prelogin/sign-up');
                              },
                              child: const Text(
                                "Don't have an account? Sign Up",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
