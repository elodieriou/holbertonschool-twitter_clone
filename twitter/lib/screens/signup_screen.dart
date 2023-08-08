import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SignUp extends StatefulWidget {
  final Auth auth;

  const SignUp({Key? key, required this.auth}) : super(key: key);

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

  Future<void> _showSnackbar(String message, {Color? backgroundColor}) async {
    await Future.delayed(const Duration(milliseconds: 250));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
    );
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
              CachedNetworkImage(
                imageUrl: 'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                placeholder: (context, url) => const CircularProgressIndicator(), // Placeholder while loading
                errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final signUpResult = await widget.auth.attemptSignUp(
                        _emailController.text,
                        _nameController.text,
                        _passwordController.text,
                        _confirmController.text,
                      );

                      switch (signUpResult) {
                        case Errors.none:
                          _showSnackbar('Account Created!', backgroundColor: Colors.green);
                          // Handle successful sign-up
                          break;
                        case Errors.matchError:
                          _showSnackbar('Passwords do not match', backgroundColor: Colors.red);
                          break;
                        case Errors.weakError:
                          _showSnackbar('The password provided is too weak.', backgroundColor: Colors.red);
                          break;
                        case Errors.existsError:
                          _showSnackbar('An account already exists with that email.', backgroundColor: Colors.red);
                          break;
                        case Errors.error:
                          _showSnackbar('Failed to create account! Please try later', backgroundColor: Colors.red);
                          break;
                        case Errors.noUserError:
                        // This case is specific to your app's business logic, handle accordingly
                          break;
                        default:
                          _showSnackbar('An unexpected error occurred', backgroundColor: Colors.red);
                      }
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
