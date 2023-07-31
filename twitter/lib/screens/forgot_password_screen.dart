import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Forget Password',
                  style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Enter your email address below to receive password reset instructions',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                CustomEntryField(
                    hint: 'Enter Email',
                    controller: _emailController
                ),

                const SizedBox(height: 20),
                CustomFlatButton(
                  label: 'Submit',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  onPressed: () {
                    if (kDebugMode) {
                      print('Forget Password Button clicked!');
                    }// Handle sign-in logic here using _emailController and _passwordController.
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
