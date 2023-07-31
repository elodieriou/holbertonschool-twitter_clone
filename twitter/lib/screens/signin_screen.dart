import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                Image.network(
                  'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                CustomEntryField(
                    hint: 'Enter Email',
                    controller: _emailController
                ),
                const SizedBox(height: 10),
                CustomEntryField(
                    hint: 'Enter password',
                    controller: _passwordController
                ),
                const SizedBox(height: 20),
                CustomFlatButton(
                  label: 'Submit',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  onPressed: () {
                    if (kDebugMode) {
                      print('Button clicked!');
                    }// Handle sign-in logic here using _emailController and _passwordController.
                  },
                ),
                const SizedBox(height: 30),
                CustomFlatButton(
                  label: 'Sign up',
                  fontSize: 20,
                  onPressed: () {
                    if (kDebugMode) {
                      print('Navigate to signup!');
                    }// Handle sign-in logic here using _emailController and _passwordController.
                  },
                ),
                const SizedBox(height: 10),
                CustomFlatButton(
                    label: 'Forget password?',
                    fontSize: 20,
                  onPressed: () {
                    if (kDebugMode) {
                      print('Navigate to forget password!');
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
