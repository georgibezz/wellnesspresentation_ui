import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Profile/all.items.table.dart';
import 'package:wellnesspresentation/Screens/Profile/all.users.table.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.green[300]
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              // Handle edit profile logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // Handle change password logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {
              // Handle notification settings logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Handle language selection logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart), // New icon for the table view
            title: const Text('All Users Data: Table View'), // New title
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllUsersScreen()), // Navigate to the new screen
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // Handle log out logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart), // New icon for the table view
            title: const Text('All Item Data: Table View'), // New title
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllItemsTableScreen()), // Navigate to the new screen
              );
            },
          ),
        ],
      ),
    );
  }
}