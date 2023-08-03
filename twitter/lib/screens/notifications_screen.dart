import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 10), // Add spacing between avatar and text field
                const Expanded(
                  child: Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.blue),
                  onPressed: () {
                    if (kDebugMode) {
                      print('Settings Button Clicked');
                    }// Handle sign-in logic here using _emailController and _passwordController.
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'No Notifications Yet',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
