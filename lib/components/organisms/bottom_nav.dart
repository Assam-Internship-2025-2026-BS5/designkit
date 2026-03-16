import 'package:flutter/material.dart' hide Icon, Text;
import '../atoms/icon.dart' as atom;
import '../atoms/text.dart' as atom;

class BottomNav extends StatelessWidget {
  final Function(String)? onNavTap;
  final List<BottomNavItemData> items;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  const BottomNav({
    super.key,
    this.onNavTap,
    required this.items,
    this.textStyle,
    this.padding = const EdgeInsets.only(top: 15, bottom: 35),
  });

  @override
  Widget build(BuildContext context) {
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
        children: List.generate(items.length, (index) {
          final item = items[index];
          return _buildBottomNavItem(item);
        }),
      ),
    );
  }

  Widget _buildBottomNavItem(BottomNavItemData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onNavTap?.call(item.label),
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
      ),
    );
  }
}

class BottomNavItemData {
  final IconData icon;
  final String label;

  BottomNavItemData({required this.icon, required this.label});
}
