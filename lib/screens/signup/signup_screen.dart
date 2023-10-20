import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignupScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _phoneTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _password2TEC = TextEditingController();


  signup() async {
    final username = _usernameTEC.text;
    final phone = _phoneTEC.text;
    final password1 = _passwordTEC.text;
    final password2 = _password2TEC.text;
    try {
      final response = await http.post(
          Uri.parse("http://492f-102-91-4-178.ngrok-free.app/user/signup/"),
          body: {"username": username, "phone": phone, "password1": password1, "password2": password2});

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
            width: 84.0, // Set the width
            height: 27.0, // Set the height
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                height: 1.22, // This corresponds to a line height of 22px for 18px font size
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
                height: 1.22, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          // Positioned username text box
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
                  textAlignVertical: TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: "what's your name?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // Positioned third text widget
          const Positioned(
            top: 244.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 60.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Phone',
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

          // Positioned Phone text box
          Positioned(
            top: 274.0, // Adjust the top position as needed
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
                  controller: _phoneTEC,
                  textAlignVertical: TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: 'your phone number?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // Positioned fourth text widget
          const Positioned(
            top: 333.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 86.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Password',
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

          // Positioned password text box
          Positioned(
            top: 363.0, // Adjust the top position as needed
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
                  textAlignVertical: TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: 'your secret code?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),


          // Positioned fifth text widget
          const Positioned(
            top: 422.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 86.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Confirm Password',
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

          // Positioned confirm password text box
          Positioned(
            top: 452.0, // Adjust the top position as needed
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
                  controller: _password2TEC,
                  textAlignVertical: TextAlignVertical.center, // Center text vertically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    hintText: "make sure it's a match",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),


          // Positioned signup button
          Positioned(
            top: 570.0, // Adjust the top position as needed
            left: 68.0, // Adjust the left position as needed
            width: 254.0, // Set the width
            height: 44.0, // Set the height
            child: InkWell(
              onTap: () {

                Navigator.pushNamed(context, '/home');
                // Navigate to /home when the image is tapped
                // signup();
              },
              child: Image.asset('assets/6.png'), // Replace with your fourth image asset path
            ),
          ),

          // Positioned already have an account button
          Positioned(
            top: 730.0, // Adjust the top position as needed
            left: 104.0, // Adjust the left position as needed
            width: 183.0, // Set the width
            height: 16.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/login');
              },
              child: Image.asset('assets/7.png'), // Replace with your fourth image asset path
            ),
          ),



        ],
      ),
    );
  }
}
