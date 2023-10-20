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
    _navigateToLoginAfterDelay();
  }

  Future<void> _navigateToLoginAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5)); // Wait for 3 seconds

    Navigator.pushNamed(context, '/load1'); // Navigate to the login screen
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
