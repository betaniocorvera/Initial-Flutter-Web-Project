import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const TutorMatchApp());
}

class TutorMatchApp extends StatelessWidget {
  const TutorMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorMatch A.I.',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        DashboardScreen.routeName: (_) => const DashboardScreen(),
      },
    );
  }
}
