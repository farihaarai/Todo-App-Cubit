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
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 400, // fixed width
              height: 400, // fixed height
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Update your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Old Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        onChanged: (val) => oldPass = val,
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        onChanged: (val) => newPass = val,
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        onChanged: (val) => confirmPass = val,
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
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
                                context.go('/postlogin/todos');
                              });
                            } else {
                              message = "Failed to change password";
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
                        icon: const Icon(Icons.save),
                        label: const Text("Change Password"),
                      ),
                    ],
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
