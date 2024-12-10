import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:beach_app/widgets/beach_card.dart'; // BeachCard widget
// ignore: unused_import
import 'package:beach_app/widgets/activity_card.dart'; 
// ignore: unused_import
import 'package:beach_app/widgets/activity_section.dart'; 
import 'package:beach_app/widgets/category_section.dart'; 
import 'package:beach_app/pages/location_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Current selected index in the bottom navigation bar

  final List<Widget> _pages = [
    MainContentScreen(), // Home page
    const LocationPage(),  // Location page
    const AlertsPage(), // Alerts page
    const FavoritesPage(), // Favorites page
    const ProfilePage(), // Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.home_outlined, color: Colors.grey),
              onPressed: () => _onItemTapped(0), // Navigate to Home page
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.location_on_outlined, color: Colors.grey),
              onPressed: () => _onItemTapped(1), // Navigate to Location page
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.warning_amber_outlined, color: Colors.grey),
              onPressed: () => _onItemTapped(2), // Navigate to Alerts page
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.favorite_border, color: Colors.grey),
              onPressed: () => _onItemTapped(3), // Navigate to Favorites page
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.person_outline, color: Colors.grey),
              onPressed: () => _onItemTapped(4), // Navigate to Profile page
            ),
          ],
        ),
      ),
    );
  }
}

   

  class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  // Custom Drawer Widget
  void _showDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5, // Half-screen height
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  print("Navigating to Home");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  print("Navigating to Settings");
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  print("Logging Out");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 241, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60), // Top padding

              // RichText Header
              RichText(
                text: TextSpan(
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(text: 'Where do\n'),
                    TextSpan(
                      text: 'you want to go?',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.07,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Spacing before search bar

              // Search Bar
              TextField(
                onChanged: (value) {
                  print("Search input: $value");
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 251, 250, 250),
                  hintText: "Search for beaches...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
             
              const SizedBox(height: 20), // Spacing before TabBar

              // Explore Cities Tab Bar
              DefaultTabController(
                length: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor:
                          Color.fromARGB(255, 14, 14, 14),
                      indicatorColor: Colors.black,
                      indicatorWeight: 4.0,
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(fontSize: 16),
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "Popular"),
                        Tab(text: "Recommended"),
                        Tab(text: "Most viewed"),
                      ],
                    ),
                    SizedBox(
                      height: 250, // Adjusted height for the Beach Cards
                      child: TabBarView(
                        children: [
                          BeachList(),
                          const Center(child: Text('Popular Beaches')),
                          const Center(child: Text('Recommended Beaches')),
                          const Center(child: Text('Most Viewed Beaches')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30), // Spacing before Activities Section

              // Activities Section
              const ActivitiesSection(),

              const SizedBox(height: 30), // Spacing before Activities Section

              // Activities Section
              const CategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }
}


class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Alerts Page",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Favorites Page",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

















 


