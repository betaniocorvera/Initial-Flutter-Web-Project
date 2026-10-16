import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'registration_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String? _email;
  // ignore: unused_field
  String? _password;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TutorMatch – Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.school, size: 96, color: Colors.indigo),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => (value == null || !value.contains('@'))
                      ? 'Enter a valid email'
                      : null,
                  onSaved: (value) => _email = value,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) => (value == null || value.length < 6)
                      ? 'Minimum 6 characters'
                      : null,
                  onSaved: (value) => _password = value,
                ),
                const SizedBox(height: 24),
                PrimaryButton(label: 'Login', onPressed: _submit),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                  },
                  child: const Text('Don\'t have an account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
