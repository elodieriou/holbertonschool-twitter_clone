import 'package:flutter/material.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  void _navigateToForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgetPassword()),
    );
  }

  void _navigateToBarMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BarMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
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
                  onPressed: _navigateToBarMenu,
                ),
                const SizedBox(height: 30),
                CustomFlatButton(
                  label: 'Sign up',
                  fontSize: 20,
                  onPressed: _navigateToSignUp,
                ),
                const SizedBox(height: 10),
                CustomFlatButton(
                    label: 'Forget password?',
                    fontSize: 20,
                  onPressed: _navigateToForgetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
