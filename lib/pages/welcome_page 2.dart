import 'package:flutter/material.dart';
import 'package:beach_app/pages/login_page.dart';
import 'package:beach_app/pages/signup_page.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const WelcomePage2(),
    );
  }
}

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity, // Full width
              decoration: const BoxDecoration(
                color: Color(0xFF282C49),
              ),
              child: Stack(
                children: [
                  // Welcome Text
                  Positioned(
                    left: screenWidth * 0.25,
                    top: screenHeight * 0.16,
                    child: Text(
                      'Hello, Welcome!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.08, // Responsive font size
                        fontFamily: 'Jockey One',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // Beach Image
                  Positioned(
                    left: screenWidth * 0.15,
                    top: screenHeight * 0.3,
                    child: Container(
                      width: screenWidth * 0.65,
                      height: screenHeight * 0.25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/places/beach.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Login Button
                  Positioned(
                    left: screenWidth * 0.12,
                    top: screenHeight * 0.65,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.76,
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAC0A3),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.05,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Sign Up Button
                  Positioned(
                    left: screenWidth * 0.12,
                    top: screenHeight * 0.74,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.76,
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAC0A3),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.05,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Social Media Text
                  Positioned(
                    left: screenWidth * 0.35,
                    top: screenHeight * 0.84,
                    child: Text(
                      'Or via social media',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

