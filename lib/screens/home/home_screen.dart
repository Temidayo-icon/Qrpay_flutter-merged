import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index to track the current tab
  var balanceAmount = 300000; // Declare the balance amount variable
  String username = "Mayowa";
  int number = 7034460654;
  String card_no = "**** **** **** 1000";
  String exp = "05/36";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 62,
        title: const Text(''),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightGreen],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        actions: [
          // Add a smaller circular border around the notification icon button
          Container(
            margin: EdgeInsets.only(right: 16.0), // Adjust the margin as needed
            width: 50.0, // Set the width of the container (controls the size of the circular border)
            height: 40.0, // Set the height of the container (controls the size of the circular border)
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Customize the border color
                width: 1.0, // Customize the border width
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.black,// Replace with your notification icon
              onPressed: () {
                // Handle notification button press here
                // You can open a notification screen or perform any desired action
              },
            ),
          ),
        ],

      ),
      body: Stack(
        children: [

          Positioned(
            top: 16.0, // Adjust the top position as needed
            left: 25.0, // Adjust the left position as needed
            width: 159.0, // Set the width
            height: 86.0, // Set the height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.lightGreen, // Set your border color
                  width: 1.0, // Set your border width
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white12, // Add your third color (e.g., blue)
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0], // Adjust the stops to control the color transition
                ),
              ),
            ),
          ),


          const Positioned(
            top: 30.0, // Adjust the top position as needed
            left: 44.0, // Adjust the left position as needed
            width: 61.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Balance',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 56.0,
            left: 43.0,
            width: 74.0,
            height: 22.0,
            child: Text('${balanceAmount}', // Display the dynamic balance amount
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                height: 1.20,
                letterSpacing: 0.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Positioned(
            top: 59.0, // Adjust the top position as needed
            left: 114.0, // Adjust the left position as needed
            width: 18.0, // Set the width
            height: 18.0, // Set the height
            child: InkWell(
              child: Image.asset('assets/home_screen/2.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 59.0, // Adjust the top position as needed
            left: 134.0, // Adjust the left position as needed
            width: 18.0, // Set the width
            height: 18.0, // Set the height
            child: InkWell(
              child: Image.asset('assets/home_screen/1.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 30.0, // Adjust the top position as needed
            left: 236.0, // Adjust the left position as needed
            width: 200.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Hello $username,',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),


          Positioned(
            top: 51.0, // Adjust the top position as needed
            left: 236.0, // Adjust the left position as needed
            width: 200.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Welcome Back',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),


          Positioned(
            top: 74.0, // Adjust the top position as needed
            left: 236.0, // Adjust the left position as needed
            width: 300.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'ID: $number',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 121.0, // Adjust the top position as needed
            left: 29.0, // Adjust the left position as needed
            width: 142.0, // Set the width
            height: 43.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/3.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 121.0, // Adjust the top position as needed
            left: 204.0, // Adjust the left position as needed
            width: 170.0, // Set the width
            height: 43.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/4.png'), // Replace with your fourth image asset path
            ),
          ),

          const Positioned(
            top: 192.0, // Adjust the top position as needed
            left: 34.0, // Adjust the left position as needed
            width: 58.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'My cards',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 192.0, // Adjust the top position as needed
            left: 264.0, // Adjust the left position as needed
            width: 64.0, // Set the width
            height: 22.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/5.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 230.0,
            left: 30.0,
            width: 300.0,
            height: 120.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 255),
                    Color.fromARGB(255, 255, 0, 255),
                    Color.fromARGB(255, 128, 0, 128),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 230.0,
            left: 30.0,
            width: 270.0,
            height: 120.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 0, 0),
                    Color.fromARGB(255, 255, 255, 0),
                    Color.fromARGB(255, 255, 165, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 230.0,
            left: 30.0,
            width: 250.0,
            height: 120.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 128, 0),
                    Color.fromARGB(255, 173, 216, 230),
                    Color.fromARGB(255, 178, 102, 255),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),


          const Positioned(
            top: 250.0, // Adjust the top position as needed
            left: 40.0, // Adjust the left position as needed
            width: 100.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Visa Card',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 250.0, // Adjust the top position as needed
            left: 210.0, // Adjust the left position as needed
            width: 100.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Visa',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 315.0, // Adjust the top position as needed
            left: 40.0, // Adjust the left position as needed
            width: 150.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              card_no,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black87, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 315.0, // Adjust the top position as needed
            left: 210.0, // Adjust the left position as needed
            width: 100.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              exp,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black87, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 374.0, // Adjust the top position as needed
            left: 34.0, // Adjust the left position as needed
            width: 107.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'Recent Activities',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 374.0, // Adjust the top position as needed
            left: 274.0, // Adjust the left position as needed
            width: 39.0, // Set the width
            height: 22.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/6.png'), // Replace with your fourth image asset path
            ),
          ),


          // const Positioned(
          //   top: 400.0, // Adjust the top position as needed
          //   left: 34.0, // Adjust the left position as needed
          //   width: 300.0, // Set the width
          //   height: 22.0, // Set the height
          //   child: Text(
          //     'Monday 14 August 2023',
          //     style: TextStyle(
          //       fontFamily: 'Inter',
          //       fontSize: 14.0,
          //       fontWeight: FontWeight.w600,
          //       height: 1.20, // This corresponds to a line height of 22px for 18px font size
          //       letterSpacing: 0.0, // No letter-spacing
          //       color: Colors.black54, // Text color set to black
          //     ),
          //     textAlign: TextAlign.left, // Text alignment
          //   ),
          // ),

          Positioned(
            top: 410.0, // Adjust the top position as needed
            left: 25.0, // Adjust the left position as needed
            width: 320.0, // Set the width
            height: 100.0, // Set the height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey, // Set your border color
                  width: 1.0, // Set your border width
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey, // Add your third color (e.g., blue)
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0], // Adjust the stops to control the color transition
                ),
              ),
            ),
          ),

          Positioned(
            top: 410.0, // Adjust the top position as needed
            left: 274.0, // Adjust the left position as needed
            width: 39.0, // Set the width
            height: 100.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/7.png'), // Replace with your fourth image asset path
            ),
          ),

          const Positioned(
            top: 430.0, // Adjust the top position as needed
            left: 80.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'You added to your coins',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 455.0, // Adjust the top position as needed
            left: 80.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              '+5000',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.green, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 475.0, // Adjust the top position as needed
            left: 80.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'at: 10/7/2023   2:30pm',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black87, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 410.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 39.0, // Set the width
            height: 100.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/8.png'), // Replace with your fourth image asset path
            ),
          ),

          Positioned(
            top: 520.0, // Adjust the top position as needed
            left: 25.0, // Adjust the left position as needed
            width: 320.0, // Set the width
            height: 100.0, // Set the height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey, // Set your border color
                  width: 1.0, // Set your border width
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey, // Add your third color (e.g., blue)
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0], // Adjust the stops to control the color transition
                ),
              ),
            ),
          ),

          const Positioned(
            top: 540.0, // Adjust the top position as needed
            left: 70.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'You removed from your coins',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 565.0, // Adjust the top position as needed
            left: 70.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              '-5000',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.green, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          const Positioned(
            top: 585.0, // Adjust the top position as needed
            left: 70.0, // Adjust the left position as needed
            width: 250.0, // Set the width
            height: 22.0, // Set the height
            child: Text(
              'at: 10/7/2023   2:30pm',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.20, // This corresponds to a line height of 22px for 18px font size
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.black87, // Text color set to black
              ),
              textAlign: TextAlign.left, // Text alignment
            ),
          ),

          Positioned(
            top: 520.0, // Adjust the top position as needed
            left: 30.0, // Adjust the left position as needed
            width: 39.0, // Set the width
            height: 100.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/9.png'), // Replace with your fourth image asset path
            ),
          ),



          Positioned(
            top: 520.0, // Adjust the top position as needed
            left: 274.0, // Adjust the left position as needed
            width: 39.0, // Set the width
            height: 100.0, // Set the height
            child: InkWell(
              onTap: () {
                // Navigate to /home when the image is tapped
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset('assets/home_screen/7.png'), // Replace with your fourth image asset path
            ),
          ),



          // Your content here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200], // Light grey background color
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Handle tapping on the navigation bar items
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
