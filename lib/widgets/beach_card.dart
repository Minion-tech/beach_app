import 'package:flutter/material.dart';
import 'package:beach_app/pages/Beachdetails_page.dart';

class BeachCard extends StatefulWidget {
  final String title;
  final String location;
  final String imagePath;

  const BeachCard({
    required this.title,
    required this.location,
    required this.imagePath,
    super.key,
  });

  @override
  State<BeachCard> createState() => _BeachCardState();
}

class _BeachCardState extends State<BeachCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the placeholder page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BeachDetailsPage()),
        );
      },
      child: Container(
        width: 170, // Adjusted width for better card size
        margin: const EdgeInsets.symmetric(horizontal: 8.0), // Added more spacing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFBFB9B9)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imagePath,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : const Color.fromARGB(255, 250, 250, 247),
                    ),
                  ),
                ),
              ],
            ),
            // Text section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.location,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Horizontal scrollable card list
class BeachList extends StatelessWidget {
  final List<Map<String, String>> beaches = [
    {
      "title": "Radhanagar",
      "location": "Andaman and Nicobar island",
      "imagePath": "assets/places/Radhanagar.jpg",
    },
    {
      "title": "Kaup",
      "location": "Karnataka",
      "imagePath": "assets/places/kaup.jpg",
    },
    {
      "title": "Auroville Beach",
      "location": "Pondicherry",
      "imagePath": "assets/places/aurrovillo.jpg",
    },
  ];

   BeachList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: beaches.length,
        itemBuilder: (context, index) {
          final beach = beaches[index];
          return BeachCard(
            title: beach['title']!,
            location: beach['location']!,
            imagePath: beach['imagePath']!,
          );
        },
      ),
    );
  }
}

// Placeholder Page for Navigation
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beach Detail"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.2,
      ),
      body: const Center(
        child: Text(
          "Beach Detail Page (Placeholder)",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}



