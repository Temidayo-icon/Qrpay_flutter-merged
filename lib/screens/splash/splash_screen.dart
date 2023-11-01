import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _showTransactionOptions();
  }

  Future<void> _showTransactionOptions() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds

    if (!context.mounted) return; // Ensure the context is still valid

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Transaction Mode'),
          content: const Text('Choose the transaction mode:'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _navigateToConnectScreen(); // Navigate to the /connect route
              },
              child: const Text('Offline'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _navigateToLoginAfterDelay(); // Navigate to the /load1 route
              },
              child: const Text('Online'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToConnectScreen() {
    Navigator.pushNamed(context, '/connect'); // Navigate to the /connect route
  }

  void _navigateToLoginAfterDelay() {
    Navigator.pushNamed(context, '/load1'); // Navigate to the /load1 route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100], // Set a light green background
      body: Center(
        child: Image.asset(
          'assets/qrpay.png', // Replace with your image path
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
        ),
      ),
    );
  }
}
