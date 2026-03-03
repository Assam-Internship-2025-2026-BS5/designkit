import 'dart:ui';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final Function(String)? onNavTap;
  final List<BottomNavItemData>? items;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  const BottomNav({
    super.key,
    this.onNavTap,
    this.items,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xFF003366),
    this.inactiveColor = const Color(0xFF4B5563),
  });

  static List<BottomNavItemData> get defaultItems => [
    BottomNavItemData(icon: Icons.cancel_outlined, label: "Maintenance"),
    BottomNavItemData(icon: Icons.help_outline, label: "Reach Us"),
    BottomNavItemData(icon: Icons.more_horiz, label: "More"),
  ];

  @override
  Widget build(BuildContext context) {
    final displayItems = items ?? defaultItems;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 50), // Lifted icons even higher
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: displayItems.map((item) => _buildBottomNavItem(item)).toList(),
      ),
    );
  }

  Widget _buildBottomNavItem(BottomNavItemData item) {
    return GestureDetector(
      onTap: () => onNavTap?.call(item.label),
      child: Row(
        children: [
          Icon(item.icon, size: 22, color: activeColor),
          const SizedBox(width: 6),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 12, // Slightly smaller label
              fontWeight: FontWeight.w500, // Medium for better readability
              color: inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItemData {
  final IconData icon;
  final String label;

  BottomNavItemData({required this.icon, required this.label});
}
