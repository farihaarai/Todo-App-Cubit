import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),

            // Email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),

            // Age
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 10),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),

            // Gender Dropdown (pure stateless)
            Row(
              children: [
                const Text("Gender: "),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedGender,
                  items: ["f", "m"]
                      .map(
                        (g) => DropdownMenuItem(
                          value: g,
                          child: Text(g.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      selectedGender = val;
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Signup button
            ElevatedButton(
              onPressed: () async {
                final age = int.tryParse(ageController.text.trim()) ?? 0;

                // Validate inputs
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    age <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all the fields")),
                  );
                  return;
                }

                // Call signup
                final user = await context.read<UsersCubit>().signup(
                  SignupRequest(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text.trim(),
                    age: age,
                    gender: selectedGender,
                  ),
                );

                if (user != null) {
                  context.go('/todos');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Signup failed. Please try again."),
                    ),
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
