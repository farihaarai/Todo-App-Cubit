import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';
import 'package:todo_app_cubit/models/user.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController(
    text: "Fariha",
  );

  final TextEditingController emailController = TextEditingController(
    text: "fariha@g.com",
  );

  final TextEditingController passwordController = TextEditingController(
    text: "1234",
  );

  final TextEditingController ageController = TextEditingController(text: "22");

  String selectedGender = 'f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D83F2), Color(0xFF8EA9F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600, //  control the card width
              ),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Name
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Age
                      TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Gender Dropdown (pure stateless)
                      Row(
                        children: [
                          const Icon(Icons.wc, color: Colors.black54),
                          const SizedBox(width: 12),
                          const Text(
                            "Gender: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 20),
                          DropdownButton<String>(
                            value: selectedGender,
                            borderRadius: BorderRadius.circular(12),
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
                                setState(() {
                                  selectedGender = val;
                                });
                              }
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: signUp,
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Back to Login
                      TextButton(
                        onPressed: () {
                          context.go('/');
                        },
                        child: const Text(
                          "Already have an account? Login",
                          style: TextStyle(fontSize: 16),
                        ),
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

  void signUp() async {
    final age = int.tryParse(ageController.text.trim()) ?? 0;

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields")),
      );
      return;
    }

    SignupRequest request = SignupRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      age: age,
      gender: selectedGender,
    );

    // print(request.toJson().toString());
    // if (1 == 1) return;

    User? user = await context.read<UsersCubit>().signup(request);

    if (!context.mounted) {
      return;
    }

    if (user != null) {
      context.go('/postlogin/todos');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup failed. Please try again.")),
      );
    }
  }
}
