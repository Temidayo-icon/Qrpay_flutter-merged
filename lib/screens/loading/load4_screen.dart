import 'package:flutter/material.dart';

class Load4Screen extends StatelessWidget {
  const Load4Screen({super.key});

  static const String routeName = '/load4';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Load4Screen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background or other widgets if needed

          // Positioned image widget
          Positioned(
            top: 130.0,
            left: 41.0,
            width: 309.0,
            height: 309.0,
            child: Image.asset('assets/load_screens/7.png'), // Replace with your first image asset path
          ),


          // Positioned first text widget
          const Positioned(
            top: 457.0, // Adjust the top position as needed
            left: 68.0, // Adjust the left position as needed
            width: 139.0, // Set the width
            height: 50.0, // Set the height
            child: Text(
              'Welcome to QRpay',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 21.0,
                fontWeight: FontWeight.w600,
                height: 1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 626.0, // Adjust the top position as needed
            left: 63.0, // Adjust the left position as needed
            width: 254.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/login');
              },
              child: Image.asset('assets/load_screens/8.png'), // Replace with your third image asset path
            ),
          ),

          // Positioned fourth image widget as a button
          Positioned(
            top: 690.0, // Adjust the top position as needed
            left: 68.0, // Adjust the left position as needed
            width: 254.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/signup');
              },
              child: Image.asset('assets/load_screens/9.png'), // Replace with your fourth image asset path
            ),
          ),
        ],
      ),
    );
  }
}