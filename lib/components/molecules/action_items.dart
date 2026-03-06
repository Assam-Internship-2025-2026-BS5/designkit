import 'package:flutter/material.dart';
import '../atoms/glass_container.dart';
import '../atoms/icon.dart' as ic;

class ActionItems extends StatefulWidget {
  final List<ActionItemData>? items;
  final Function(ActionItemData)? onItemTap;

  const ActionItems({
    super.key,
    this.items,
    this.onItemTap,
  });

  @override
  State<ActionItems> createState() => _ActionItemsState();

  static List<ActionItemData> get defaultItems => [
        ActionItemData(
          title: "Send Money",
          imagePath: "assets/Send_money.png",
          isFullImage: true,
        ),
        ActionItemData(
          title: "Pay Bills",
          imagePath: "assets/Pay_bills.png",
          isFullImage: true,
        ),
        ActionItemData(
          title: "Product &\nServices",
          imagePath: "assets/Product_services.png",
          isFullImage: true,
        ),
      ];
}

class _ActionItemsState extends State<ActionItems> {
  int? _pressedIndex;

  @override
  Widget build(BuildContext context) {
    final displayItems = widget.items ?? ActionItems.defaultItems;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(displayItems.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildActionTile(displayItems[index], index),
          );
        }),
      ),
    );
  }

  Widget _buildActionTile(ActionItemData item, int index) {
    final isPressed = _pressedIndex == index;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressedIndex = index),
      onTapUp: (_) => setState(() => _pressedIndex = null),
      onTapCancel: () => setState(() => _pressedIndex = null),
      onTap: () => widget.onItemTap?.call(item),
      child: AnimatedScale(
        scale: isPressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100,
              height: 100, // Uniform height for button style
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isPressed ? 0.02 : 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Top section containing icon
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ic.Icon(
                            item.icon,
                            imagePath: item.imagePath,
                            size: 100, // Full size for the button
                            color: item.iconColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (item.showBadge && !item.isFullImage)
              Positioned(
                top: -10,
                right: -5,
                child: Transform.rotate(
                  angle: 0.2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E), // Green
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      "OFFER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class ActionItemData {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final Color? iconColor;
  final bool showBadge;
  final bool isFullImage;

  ActionItemData({
    required this.title,
    this.icon,
    this.imagePath,
    this.iconColor,
    this.showBadge = false,
    this.isFullImage = false,
  });
}
