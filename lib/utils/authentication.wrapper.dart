import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/user.entity.dart';
import 'package:wellnesspresentation/utils/auth_service.dart';
import 'package:wellnesspresentation/utils/bottom.nav.bar.dart';
import 'package:wellnesspresentation/utils/log.in.screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  final Widget child;
  final AuthService _authService = AuthService();

  AuthenticationWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator while checking authentication state
          return Scaffold(body: CircularProgressIndicator());
        } else {
          final user = snapshot.data;
          if (user == null) {
            // User not authenticated, show login screen
            return LoginScreen();
          } else {
            // User authenticated, show bottom navigation bar
            return MyBottomNavigationBar();
          }
        }
      },
    );
  }
}


