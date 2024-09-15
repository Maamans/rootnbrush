import 'package:flutter/material.dart';
import 'package:rootandbrush/screens/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900], // Background color similar to the image
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Back Icon Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white, // Color for the back icon
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigates back to the previous screen
                },
              ),
            ),
            const Spacer(), // Pushes the following content to the center
            const Text(
              'Already have an account ?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey[300]),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password TextField
            TextField(
              obscureText: true, // This makes the input text hidden (like a password)
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[300]),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to Signup
                            );  
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[500],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white,),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Google Sign-in button (using Google icon instead of image)
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.g_mobiledata, // This is a Google "G" icon from the Flutter Icons
                size: 24,
              ),
              label: const Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Apple Sign-in button
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.apple,
                size: 20,
              ),
              label: const Text(
                'Sign in with Apple',
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const Spacer(), // Pushes the back button and title to the top and the rest to the bottom
          ],
        ),
      ),
    );
  }
}
