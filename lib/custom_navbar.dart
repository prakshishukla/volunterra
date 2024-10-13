import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex; // Current active index
  final Function(int) onTap; // Callback function for tap events

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey[800], // Background color for the nav bar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customNavBarItem(Icons.add_circle_outline, 0),
          SizedBox(width: 5),
          customNavBarItem(Icons.favorite, 1),
          SizedBox(width: 5),
          customNavBarItem(Icons.location_on, 2),
          SizedBox(width: 5),
          customNavBarItem(Icons.message, 3),
          SizedBox(width: 5),
          customNavBarItem(Icons.person, 4),
        ],
      ),
    );
  }

  Widget customNavBarItem(IconData icon, int index) {
    Color iconColor = currentIndex == index ? Colors.green[300]! : Colors.green;

    return GestureDetector(
      onTap: () => onTap(index), // Call onTap when tapped
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: iconColor, width: 2),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}