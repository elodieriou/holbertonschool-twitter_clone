import 'package:flutter/material.dart';
import './widgets/entry_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Entry Field Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomEntryField(
                  hint: 'Enter email',
                  controller: TextEditingController(), // Create a TextEditingController if you don't have one
                ),
                const SizedBox(height: 20), // Optional spacing between widgets
                CustomEntryField(
                  hint: 'Enter password',
                  controller: TextEditingController(), // Create a TextEditingController if you don't have one
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
