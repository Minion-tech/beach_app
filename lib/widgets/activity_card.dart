import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityCard extends StatelessWidget {
  final String activityName;
  final String svgPath;
  final Color borderColor; // New parameter for circle border color

  const ActivityCard({
    required this.activityName,
    required this.svgPath,
    this.borderColor = Colors.black, // Default border color is black
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circle Container
        Container(
          width: 60, // Fixed circle size
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1), // Circle border
          ),
          child: Center(
            child: SvgPicture.asset(
              svgPath,
              width: 40, // Adjust size of the icon
              height: 40,
              
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between icon and text
        Text(
          activityName,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

