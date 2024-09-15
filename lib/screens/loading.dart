import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rootandbrush/screens/started.dart';

class CustomImageStack extends StatefulWidget {
  const CustomImageStack({Key? key}) : super(key: key);

  @override
  _CustomImageStackState createState() => _CustomImageStackState();
}

class _CustomImageStackState extends State<CustomImageStack> {
  @override
  void initState() {
    super.initState();

    // Start a timer for 5 seconds and navigate to the next screen when complete
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartedScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background and content
                Container(
                  height: 900, // Adjust the height to fit all elements with spacing
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A174A), Color(0xFF261C59)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // Centered Logo at the Top
                Positioned(
                  top: 40, // Position the logo at the top
                  left: MediaQuery.of(context).size.width / 2 - 40, // Center horizontally
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/logo.png'), // Replace with your logo image
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Stacked, tilted images with sizes adjusting from large to small
                Positioned(
                  right: 0, // Ensure the image touches the right edge
                  top: 180, // Adjust top value to create space between the logo and first image
                  child: Transform.rotate(
                    angle: 0.35, // Tilt for the first image
                    child: Container(
                      height: 340, // Largest size
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('images/stickman.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0, // Keep the second image also at the right edge
                  top: 350, // Adjust top to overlap and keep distance from the first image
                  child: Transform.rotate(
                    angle: 0.40, // Tilt for the second image
                    child: Container(
                      height: 300, // Medium size
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('images/africanwoman.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0, // Keep the third image also at the right edge
                  top: 550, // Adjust top to overlap and keep distance from the second image
                  child: Transform.rotate(
                    angle: 0.30, // No tilt for the third image
                    child: Container(
                      height: 260, // Smallest size
                      width: 305,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('images/childlaugh.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Five loading dots in a column format
                Positioned(
                  left: 15, // Adjust left value to place it at the desired position
                  top: MediaQuery.of(context).size.height * 0.43,
                  child: Column(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: index == 1 ? Colors.purple : Colors.grey, // Highlight one dot
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Root N Brush text below the dots
                Positioned(
                  left: 15,
                  top: MediaQuery.of(context).size.height * 0.63, // Position below dots
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: const Text(
                      "ROOT N BRUSH",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



void main() {
  runApp(const MaterialApp(
    home: CustomImageStack(),
  ));
}
