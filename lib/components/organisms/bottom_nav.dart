import 'package:flutter/material.dart' hide Icon, Text;
import '../atoms/icon.dart' as atom;
import '../atoms/text.dart' as atom;

class BottomNav extends StatelessWidget {
  final Function(String)? onNavTap;
  final List<BottomNavItemData> items;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
  final EdgeInsets padding;

  const BottomNav({
    super.key,
    this.onNavTap,
    this.items = const [],
    this.textStyle,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xFF003366),
    this.inactiveColor = const Color(0xFF4B5563),
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.only(top: 15, bottom: 35),
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) => _buildBottomNavItem(item)).toList(),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            atom.Icon(item.icon, size: 24, color: activeColor),
            const SizedBox(width: 6),
            atom.Text(
              text: item.label,
              fontSize: textStyle?.fontSize ?? 14,
              fontWeight: textStyle?.fontWeight ?? FontWeight.w600,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItemData {
  final IconData icon;
  final String label;

  BottomNavItemData({required this.icon, required this.label});
}
