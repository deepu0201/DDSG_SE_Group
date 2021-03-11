import 'package:event_processing_system/screens/admin_screen.dart';
import 'package:event_processing_system/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:event_processing_system/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Processing System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/loginScreen': (context) => LoginScreen(),
        '/adminScreen': (context) => AdminScreen(),
      },
    );
  }
}
