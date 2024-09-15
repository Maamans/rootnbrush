import 'package:flutter/material.dart';
import 'package:rootandbrush/screens/home.dart';
import 'package:rootandbrush/screens/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Controllers for the input fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _termsAccepted = false; // For managing the checkbox state

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _firstNameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A174A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back icon button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Navigates back to the previous page
                  },
                ),
              ),
              const SizedBox(height: 40), // Give some space from the top
              // Title
              const Text(
                "Complete your profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Input fields
              _buildTextField(_firstNameController, "First name"),
              _buildTextField(_nameController, "Name"),
              _buildTextField(_emailController, "E-mail"),
              _buildTextField(_phoneController, "Phone number"),
              _buildTextField(_passwordController, "Password", obscureText: true),
              _buildTextField(_confirmPasswordController, "Confirm Password", obscureText: true),
              const SizedBox(height: 10),
              // Dropdown for "What do you want to use our app for?"
              _buildDropdown(),
              const SizedBox(height: 10),
              // Terms and conditions checkbox
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        _termsAccepted = value ?? false;
                      });
                    },
                    activeColor: Colors.purpleAccent,
                  ),
                  const Expanded(
                    child: Text(
                      'By clicking "Agree," you accept the terms and conditions.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Save profile button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to Signup
                            );  
                  if (_termsAccepted) {
                    // Perform form validation and submission
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 101, 5, 119),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Save your profile →',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // "Already have an account?" text and "Sign in" button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignIn()), // Navigate to Signup
                            );  
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable method to build text fields
  Widget _buildTextField(TextEditingController controller, String hintText, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  // Dropdown for selecting app usage
  Widget _buildDropdown() {
    String selectedValue = "What do you want to use our app for?"; // Default value
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        underline: const SizedBox(), // Hide the underline
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: <String>[
          'What do you want to use our app for?',
          'Explore content',
          'Share artwork',
          'Collaborate with others',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
