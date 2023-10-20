import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  login() async {
    final username = _usernameTEC.text;
    final password = _passwordTEC.text;
    try {
      final response = await http.post(
          Uri.parse("http://492f-102-91-4-178.ngrok-free.app/user/login/"),
          body: {"username": username, "password": password});

      if (response.statusCode == 200){
        print(response.body);
      }
      else{
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned first text widget
          const Positioned(
            top: 86.0, // Adjust the top position as needed
            left: 165.0, // Adjust the left position as needed
            width: 60.0, // Set the width
            height: 27.0, // Set the height
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                height:
                    1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          // Positioned Second text widget
          const Positioned(
            top: 155.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 90.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height:
                    1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          // Positioned login text box
          Positioned(
            top: 185.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 330.0, // Set the width
            height: 50.0, // Set the height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Colors.green, // Set the border color to light green
                ),
              ),
              child: Center(
                child: TextField(
                  controller: _usernameTEC,
                  textAlignVertical:
                      TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: "what's your name?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          const Positioned(
            top: 260.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 86.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height:
                    1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 290.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 330.0, // Set the width
            height: 50.0, // Set the height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Colors.green, // Set the border color to light green
                ),
              ),
              child: Center(
                child: TextField(
                  controller: _passwordTEC,
                  textAlignVertical:
                      TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: 'your secret code?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 351.0, // Adjust the top position as needed
            left: 42.0, // Adjust the left position as needed
            width: 18.0, // Set the width
            height: 18.0, // Set the height
            child: InkWell(
              onTap: () {
                // Handle checkbox tap here
              },
              child: Container(
                width: 18.0,
                height: 18.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Oval shape
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey, // Set the border color to light grey
                  ),
                ),
                child: Center(
                  child: // Add your checkbox widget here
                      Checkbox(
                    value: false, // Set the initial value of the checkbox
                    onChanged: (bool? newValue) {
                      // Handle checkbox state change here
                    },
                  ),
                ),
              ),
            ),
          ),

          // Positioned widget for "save password" text
          const Positioned(
            top: 354.0, // Adjust the top position as needed
            left: 64.0, // Adjust the left position as needed
            width: 100.0, // Increase the width to accommodate larger text
            height: 14.0, // Set the height
            child: Text(
              'save password',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11.0, // Increase the font size
                fontWeight: FontWeight.w400,
                height:
                    1.30, // This corresponds to a line height of 22px for 11px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 354.0, // Adjust the top position as needed
            left: 270.0, // Adjust the left position as needed
            width: 100.0, // Increase the width to accommodate larger text
            height: 14.0, // Set the height
            child: Text(
              'Forgot password? ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11.0, // Increase the font size
                fontWeight: FontWeight.w400,
                height:
                    1.30, // This corresponds to a line height of 22px for 11px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.green, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 415.0, // Adjust the top position as needed
            left: 68.0, // Adjust the left position as needed
            width: 254.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {

                Navigator.pushNamed(context, '/home');
                // Navigate to /home when the image is tapped
                // signup();
              },
              child: Image.asset(
                  'assets/2.png'), // Replace with your fourth image asset path
            ),
          ),

          // Positioned widget with updated layout and typography
          const Positioned(
            top: 472.0, // Adjust the top position as needed
            left: 149.0, // Adjust the left position as needed
            width: 93.0, // Set the width
            height: 15.0, // Set the height
            child: Text(
              'or continue with',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12.0, // Set the font size to 12px
                fontWeight: FontWeight.w500,
                height:
                    1.50, // Set the line height to match the height of the text
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 507.0, // Adjust the top position as needed
            left: 127.0, // Adjust the left position as needed
            width: 57.0, // Set the width
            height: 57.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/splash');
              },
              child: Image.asset(
                  'assets/3.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 507.0, // Adjust the top position as needed
            left: 208.0, // Adjust the left position as needed
            width: 57.0, // Set the width
            height: 57.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/splash');
              },
              child: Image.asset(
                  'assets/4.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 730.0, // Adjust the top position as needed
            left: 104.0, // Adjust the left position as needed
            width: 182.0, // Set the width
            height: 16.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/signup');
              },
              child: Image.asset(
                  'assets/5.png'), // Replace with your fourth image asset path
            ),
          ),
        ],
      ),
    );
  }
}
