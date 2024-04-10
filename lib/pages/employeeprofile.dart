import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Section with Avatar and Name
            const Row(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://placehold.it/150'), // Replace with actual image URL
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text('Software Engineer'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // Middle Section with Employee Information
            ListView(
              shrinkWrap: true, // Prevent list from expanding
              children: [
                const ListTile(
                  leading: Icon(Icons.apartment),
                  title: Text('Department: Marketing'),
                ),
                const ListTile(
                  leading: Icon(Icons.place),
                  title: Text('Location: Bacolod City'),
                ),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text('john.doe@gmail.com'),
                  trailing: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Trigger email functionality
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // Bottom Section with Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Edit Profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Trigger Contact Me functionality
                  },
                  child: const Text('Contact Me'),  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// This is the new EditProfilePage class
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Add form fields and functionality to edit user information here
        child: Column(
          children: [
            // Text fields for name, email, etc.
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            // ... more fields
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Save profile changes
                Navigator.pop(context); // Go back to EmployeeProfilePage
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
