import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomEntryField(
                  hint: 'Enter name',
                  controller: _nameController,
              ),
              const SizedBox(height: 10),
              CustomEntryField(
                  hint: 'Enter email',
                  controller: _emailController
              ),
              const SizedBox(height: 10),
              CustomEntryField(
                  hint: 'Enter password',
                  controller: _passwordController
              ),
              const SizedBox(height: 10),
              CustomEntryField(
                  hint: 'Confirm password',
                  controller: _passwordController
              ),
              const SizedBox(height: 24),
              CustomFlatButton(
                  label: 'Submit',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                onPressed: () {
                  if (kDebugMode) {
                    print('Signup Button Clicked');
                  }// Handle sign-in logic here using _emailController and _passwordController.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
