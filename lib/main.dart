import 'package:flutter/material.dart';
import 'homepage.dart';
import 'pages/notification.dart';
import 'pages/message.dart'; // Import message.dart
import 'pages/employee.dart';
import 'pages/employeeprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const NotificationPage(),
    const MessagePage(),
    const EmployeePage(),
    const EmployeeProfilePage(), // Add MessagePage to the screens list
  ];

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications, color: Colors.black),
      label: 'Notifications',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.message, color: Colors.black),
      label: 'Messages',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.people, color: Colors.black),
      label: 'Employees',
    ),
        const BottomNavigationBarItem(
      icon: Icon(Icons.person, color: Colors.black),
      label: 'Profile',
    ),
  ];

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Hire Hero',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleMenuSelection(item, context),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    Text('Settings'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.help),
                    Text('Help'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    ),
  );
}

void handleMenuSelection(int item, BuildContext context) {
  switch (item) {
    case 1:
      // Handle Settings selection
      // You can navigate to a settings page or perform other actions
      break;
    case 2:
      // Handle Help selection
      // You can show a help dialog or navigate to a help page
      break;
  }
}
}
