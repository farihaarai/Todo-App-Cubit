import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cubit/cubit/users_cubit.dart';
import 'package:todo_app_cubit/models/requests/auth_requests.dart';
import 'package:todo_app_cubit/models/user.dart';

class EditProfileScreen extends StatelessWidget {
  final User user; // current user passed from TodoScreen

  EditProfileScreen({super.key, required this.user});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers only once using the passed user
    nameController.text = user.name!;
    ageController.text = user.age.toString();
    String selectedGender = user.gender!; // dropdown initial value

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Gender: "),
                SizedBox(width: 20),
                StatefulBuilder(
                  builder: (context, setState) => DropdownButton<String>(
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
                        setState(() {
                          selectedGender = val;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final name = nameController.text.trim();
                  final age = int.tryParse(ageController.text) ?? 0;
                  if (name.isEmpty || age <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter valid details"),
                      ),
                    );
                    return;
                  }

                  await context.read<UsersCubit>().updateUserProfile(
                    UpdateUserRequest(
                      age: age,
                      name: name,
                      gender: selectedGender,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profile updated successfully"),
                    ),
                  );

                  // Navigate back
                  context.go('/todos');
                },
                child: const Text("Save Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
