import 'package:flutter/material.dart' hide Icon, Text;
import '../atoms/icon.dart' as atom;
import '../atoms/text.dart' as atom;

class BottomNav extends StatelessWidget {
  final Function(String)? onNavTap;
  final List<BottomNavItemData> items;
<<<<<<< Updated upstream
  final TextStyle? textStyle;
=======
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
>>>>>>> Stashed changes
  final EdgeInsets padding;

  const BottomNav({
    super.key,
    this.onNavTap,
<<<<<<< Updated upstream
    required this.items,
    this.textStyle,
    this.padding = const EdgeInsets.only(top: 15, bottom: 35),
=======
    this.items = const [],
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xFF003366),
    this.inactiveColor = const Color(0xFF4B5563),
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.only(top: 12, bottom: 35),
>>>>>>> Stashed changes
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
=======
    if (items.isEmpty) return const SizedBox.shrink();

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return _buildBottomNavItem(item);
        }),
=======
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) => _buildBottomNavItem(item)).toList(),
>>>>>>> Stashed changes
      ),
    );
  }

  Widget _buildBottomNavItem(BottomNavItemData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onNavTap?.call(item.label),
<<<<<<< Updated upstream
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          atom.Icon(item.icon, size: 22, color: const Color(0xFF1E3A8A)),
          const SizedBox(width: 6),
          atom.Text(
            text: item.label,
            fontSize: textStyle?.fontSize ?? 14,
            fontWeight: textStyle?.fontWeight ?? FontWeight.w600,
            color: const Color(0xFF1E3A8A),
          ),
        ],
=======
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
              color: textColor,
            ),
          ],
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}

class BottomNavItemData {
  final IconData icon;
  final String label;

  BottomNavItemData({required this.icon, required this.label});
}
