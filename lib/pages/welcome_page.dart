import 'package:flutter/material.dart';
import 'package:beach_app/pages/welcome_page%202.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image that fills the screen
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/places/wallpaper.jpg'), // Replace with your image URL
                fit: BoxFit.cover, // This ensures the image covers the screen
              ),
            ),
          ),
          // Gradient overlay (optional to add a dark gradient effect)
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF030C1A).withOpacity(0.7)
                ], // Dark gradient effect
              ),
            ),
          ),
          // Positioned card at the bottom
          Positioned(
            bottom: screenHeight * 0.05, // Positioned slightly above the bottom
            left: screenWidth * 0.05, // Small padding from the sides
            right: screenWidth * 0.05,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Discover best beaches in India',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF1D192B),
                      fontSize:
                          screenWidth * 0.07, // Adjusted for responsiveness
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    '"Discover Endless Fun in the Sun: Your Ultimate Beach Adventure Awaits!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF1D192B),
                      fontSize:
                          screenWidth * 0.04, // Adjusted for responsiveness
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const WelcomePage2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1D192B), // Button background color
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Explore now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
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

    //return Container(
      //decoration: BoxDecoration(
        //image: DecorationImage(
          //image: AssetImage('assets/places/wallpaper.jpg'),
          //fit: BoxFit.cover,
         // opacity: 0.7,

        //)
      //)
    //);
  //}
//}