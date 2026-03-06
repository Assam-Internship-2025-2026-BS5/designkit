import 'package:flutter/material.dart' hide Icon, Text;
import 'package:flutter/material.dart' as m show MainAxisSize, Image, Color, BoxFit;
import '../atoms/icon.dart';
import '../atoms/text.dart';

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
    BottomNavItemData(icon: Icons.build_circle_outlined, label: "Maintenance"),
    BottomNavItemData(icon: Icons.chat_bubble_outline, label: "Reach Us"),
    BottomNavItemData(icon: Icons.more_horiz_rounded, label: "More"),
  ];

  @override
  Widget build(BuildContext context) {
    final displayItems = items ?? defaultItems;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: displayItems.map((item) => _buildBottomNavItem(item)).toList(),
      ),
    );
  }

  Widget _buildBottomNavItem(BottomNavItemData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onNavTap?.call(item.label),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: m.MainAxisSize.min,
          children: [
            if (item.imagePath != null)
              m.Image.asset(
                item.imagePath!,
                width: 28,
                height: 28,
                fit: m.BoxFit.contain,
              )
            else
              Icon(item.icon, size: 24, color: activeColor),
            const SizedBox(width: 10),
            Text(
              text: item.label,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItemData {
  final IconData? icon;
  final String? imagePath;
  final String label;

  BottomNavItemData({this.icon, this.imagePath, required this.label});
}
