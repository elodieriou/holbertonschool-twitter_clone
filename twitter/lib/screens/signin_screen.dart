import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';

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
      MaterialPageRoute(
        builder: (context) {
          final auth = Provider.of<Auth>(context, listen: false);
          return SignUp(auth: auth);
        },
      ),
    );
  }

  void _navigateToForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgetPassword()),
    );
  }

  void _navigateToBarMenu() async {
    final auth = Provider.of<Auth>(context, listen: false);
    final email = _emailController.text;
    final password = _passwordController.text;

    final loginResult = await auth.attemptLogin(email, password);

    if (loginResult == Errors.none) {
      // Successful login, navigate to home screen (BarMenu)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BarMenu()),
      );
    } else {
      String errorMessage = '';
      switch (loginResult) {
        case Errors.noUserError:
          errorMessage = 'No user found for that email!';
          break;
        case Errors.wrongError:
          errorMessage = 'Wrong password!';
          break;
        case Errors.error:
          errorMessage = 'Failed to Login! Please try later.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }

      // Show a red snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
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
                Image.asset(
                  'assets/twitter_logo.png',
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
