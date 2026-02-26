import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final Function(String)? onNavTap;

  const BottomNav({
    super.key,
    this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavItem(Icons.cancel_outlined, "Maintenance"),
          _buildBottomNavItem(Icons.help_outline, "Reach Us"),
          _buildBottomNavItem(Icons.more_horiz, "More"),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () => onNavTap?.call(label),
      child: Row(
        children: [
          Icon(icon, size: 22, color: const Color(0xFF004C8F)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}
