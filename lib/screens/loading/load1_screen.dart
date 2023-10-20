import 'package:flutter/material.dart';

class Load1Screen extends StatelessWidget {
  const Load1Screen({Key? key});

  static const String routeName = '/load1';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Load1Screen(),
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
            top: 125.0,
            left: 78.0,
            width: 235.0,
            height: 235.0,
            child: Image.asset('assets/load_screens/1.png'), // Replace with your first image asset path
          ),

          // Positioned second image widget
          Positioned(
            top: 410.0,
            left: 156.0,
            width: 78.0,
            height: 18.0,
            child: Image.asset('assets/load_screens/2.png'), // Replace with your second image asset path
          ),

          // Positioned first text widget
          const Positioned(
            top: 464.0, // Adjust the top position as needed
            left: 137.0, // Adjust the left position as needed
            width: 117.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Pay your bills',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height: 1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          // Positioned second text widget
          const Positioned(
            top: 504.0, // Adjust the top position as needed
            left: 49.0, // Adjust the left position as needed
            width: 292.0, // Set the width
            height: 30.0, // Set the height
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Commodo elit massa dignissim viverra morbi.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                height: 1.25, // This corresponds to a line height of 15px for 12px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.center, // Text alignment
            ),
          ),
          // Positioned third image widget
          Positioned(
            top: 700.0, // Adjust the top position as needed
            left: 207.0, // Adjust the left position as needed
            width: 137.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/load2');
              },
              child: Image.asset('assets/load_screens/3.png'), // Replace with your third image asset path
            ),
          ),

          // Positioned fourth image widget as a button
          Positioned(
            top: 700.0, // Adjust the top position as needed
            left: 47.0, // Adjust the left position as needed
            width: 137.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/load2');
              },
              child: Image.asset('assets/load_screens/4.png'), // Replace with your fourth image asset path
            ),
          ),
        ],
      ),
    );
  }
}
