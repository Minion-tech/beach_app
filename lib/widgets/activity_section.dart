import 'package:flutter/material.dart';
import 'package:beach_app/widgets/activity_card.dart';

class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {"name": "Boating", "icon": "assets/icons/boating.svg"},
      {"name": "Surfing", "icon": "assets/icons/surfing.svg"},
      {"name": "Paragliding", "icon": "assets/icons/paragliding.svg"},
      {"name": "Camping", "icon": "assets/icons/camping.svg"},
      {"name": "Fishing", "icon": "assets/icons/fishing.svg"},
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
            "Activities",
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
                  child: ActivityCard(
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



