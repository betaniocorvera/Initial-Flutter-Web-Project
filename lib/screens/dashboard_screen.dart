import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dummyCourses = [
      'Math – Algebra I',
      'Physics – Mechanics',
      'Chemistry – Organic Basics',
      'English – Essay Writing',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TutorMatch – Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to TutorMatch A.I.!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your recommended courses / tutoring sessions:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: dummyCourses.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final course = dummyCourses[index];
                  return ListTile(
                    leading: const Icon(Icons.book, color: Colors.indigo),
                    title: Text(course),
                    trailing: PrimaryButton(
                      label: 'Book',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Booked \"$course\" (placeholder)')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
