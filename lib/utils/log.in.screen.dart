import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/home.screen.view.dart';
import 'package:wellnesspresentation/utils/global.colors.dart';
import 'package:wellnesspresentation/utils/auth_service.dart';
import 'package:wellnesspresentation/utils/bottom.nav.bar.dart';
import 'package:wellnesspresentation/utils/sign.up.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoggingIn = false;
  bool _showAccountNotFoundMessage = false;
  bool _showWrongPasswordMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'Images/logo.png', // Replace with the correct image path
                    width: 100, // Adjust the width as needed
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: GlobalColors.TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    setState(() {
                      _isLoggingIn = true;
                      _showAccountNotFoundMessage = false;
                      _showWrongPasswordMessage = false;
                    });

                    final user =
                    await _authService.signInWithEmailAndPassword(email, password);
                    if (user != null) {
                      setState(() {
                        _isLoggingIn = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyBottomNavigationBar()),
                      );
                    } else {
                      setState(() {
                        _isLoggingIn = false;
                        if (_authService.accountExists(email)) {
                          _showWrongPasswordMessage = true;
                        } else {
                          _showAccountNotFoundMessage = true;
                        }
                      });
                    }
                  },
                  child: _isLoggingIn
                      ? CircularProgressIndicator()
                      : Text('Login'),
                ),
                if (_showAccountNotFoundMessage)
                  const Text(
                    'Account not found. Please sign up first in order to log in.',
                    style: TextStyle(color: Colors.red),
                  ),
                if (_showWrongPasswordMessage)
                  const Text(
                    'Wrong password. Please enter the correct password.',
                    style: TextStyle(color: Colors.red),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
