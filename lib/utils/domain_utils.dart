import 'package:flutter/material.dart';

class DomainUtils {
  static const keys = ['b', 's', 'd', 'e'];

  static const colors = [
    Color(0xFF4CAF50), // b - green
    Color(0xFF2196F3), // s - blue
    Color(0xFFFF9800), // d - orange
    Color(0xFF9C27B0), // e - purple
  ];

  static const icons = [
    Icons.psychology,
    Icons.accessibility_new,
    Icons.directions_walk,
    Icons.public,
  ];

  static Color colorFor(String domain) {
    final index = keys.indexOf(domain);
    return index >= 0 ? colors[index] : Colors.grey;
  }

  static IconData iconFor(String domain) {
    final index = keys.indexOf(domain);
    return index >= 0 ? icons[index] : Icons.help_outline;
  }

  static int indexOf(String domain) => keys.indexOf(domain);
}
