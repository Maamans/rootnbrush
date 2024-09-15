import 'package:flutter/material.dart';
import 'package:rootandbrush/screens/signup.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpeg'), // Add your background image asset here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // Logo at the top (Replace with your actual logo image)
                    const SizedBox(height: 50),
                    Image.asset(
                      'images/logo.png', // Replace with your custom logo asset
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(height: 20),
                    // Title text
                    const Text(
                      'Welcome to Root N Brush',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Transparent card containing Explore Creativity and the button
                Card(
                  color: Colors.black.withOpacity(0.5), // Transparent background
                  elevation: 0, // Remove the shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners for the card
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // Subtitle text
                        const Text(
                          'Explore Creativity',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'A Hub where creatives can showcase, connect, collaborate, and sell their Master Piece(s)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Get started button
                        ElevatedButton(
                          onPressed: () {
Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Signup()), // Navigate to Signup
                            );                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent, // Button background color
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Get started now',
                            style: TextStyle(
                              fontSize: 18,color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
