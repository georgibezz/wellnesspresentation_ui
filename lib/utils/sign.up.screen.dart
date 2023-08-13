import 'package:flutter/material.dart';
import 'package:wellnesspresentation/utils/auth_service.dart';
import 'package:wellnesspresentation/utils/global.colors.dart';
import 'package:wellnesspresentation/utils/log.in.screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isSigningUp = false;

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
                  'Sign Up for a new account',
                  style: TextStyle(
                    color: GlobalColors.TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final confirmPassword = _confirmPasswordController.text;

                    if (password == confirmPassword) {
                      setState(() {
                        _isSigningUp = true;
                      });

                      final user = await _authService.registerWithEmailAndPassword(name, email, password);
                      if (user != null) {
                        setState(() {
                          _isSigningUp = false;
                        });
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign up successful! Please log in.')),
                        );
                        // Navigate back to the login screen
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          _isSigningUp = false;
                        });
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign up failed. Email already exists or an error occurred.')),
                        );
                      }
                    } else {
                      // Show password mismatch error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match.')),
                      );
                    }
                  },
                  child: _isSigningUp
                      ? CircularProgressIndicator()
                      : Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

