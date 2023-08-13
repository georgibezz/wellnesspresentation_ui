import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/user.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/utils/auth_service.dart'; // Import your AuthenticationWrapper
import 'package:wellnesspresentation/utils/bottom.nav.bar.dart';
import 'package:flutter/material.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/utils/auth_service.dart';
import 'package:wellnesspresentation/utils/log.in.screen.dart';// Import your login screen
import 'package:wellnesspresentation/utils/sign.up.screen.dart'; // Import your sign-up screen
import 'package:wellnesspresentation/utils/authentication.wrapper.dart'; // Import your AuthenticationWrapper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBoxService.openObjectBoxStore();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Library App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set the initial route to the login screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
