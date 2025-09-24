import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String selectedGender = "f"; // default

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
                DropdownButton<String>(
                  value: selectedGender,
                  items: ["f", "m"]
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      selectedGender = val; // used when saving
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // final name = nameController.text.trim();
                  // final age = int.tryParse(ageController.text) ?? 0;
                  // // final success = await updateUserProfile(
                  // //   name: name,
                  // //   age: age,
                  // //   gender: selectedGender,
                  // // );

                  // if (context.mounted) {
                  //   if (success) {
                  //     Navigator.pop(context);
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text("Profile updated successfully"),
                  //       ),
                  //     );
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text("Failed to update profile"),
                  //       ),
                  //     );
                  //   }
                  // }
                },
                child: const Text("Save Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Dummy function — replace with your API call
}
