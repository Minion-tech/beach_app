import 'package:flutter/material.dart';
import 'package:beach_app/widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {"name": "Restaurant", "icon": "assets/icons/restaurant.svg"},
      {"name": "Cafe", "icon": "assets/icons/cafe.svg"},
      {"name": "Hotel", "icon": "assets/icons/hotel.svg"},
      {"name": "Rent a House", "icon": "assets/icons/rent a house.svg"},
      
    ];

   final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10), // Spacing

        // Activities Horizontal Scrollable Row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: activities.map((activity) {
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: CategoryCard(
                    activityName: activity["name"]!,
                    svgPath: activity["icon"]!,
                    borderColor: Colors.black, // Pass the circle border color
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}