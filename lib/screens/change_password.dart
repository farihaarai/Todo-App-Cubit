import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String oldPass = '';
    String newPass = '';
    String confirmPass = '';
    String message = '';

    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Old Password"),
              onChanged: (val) {
                oldPass = val;
              },
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "New Password"),
              onChanged: (val) {
                newPass = val;
              },
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              onChanged: (val) {
                confirmPass = val;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (newPass != confirmPass) {
                  message = "New passwords do not match";
                } else if (oldPass.isEmpty || newPass.isEmpty) {
                  message = "Password cannot be empty";
                } else {
                  final (success) = await context
                      .read<UsersCubit>()
                      .changePassword(
                        ChangePasswordRequest(
                          currentPassword: oldPass,
                          newPassword: newPass,
                        ),
                      );
                  if (success) {
                    message = "Password changed successfully";
                    Future.delayed(const Duration(seconds: 1), () {
                      context.go('/todos');
                    });
                  } else {
                    message = "failed to change password";
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: message.contains("success")
                        ? Colors.green
                        : Colors.red,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Change Password"),
            ),
          ],
        ),
      ),
    );
  }
}
