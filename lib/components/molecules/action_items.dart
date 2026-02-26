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
        ),
        ActionItemData(
          title: "Pay Bills",
          imagePath: "assets/Pay_bills.png",
        ),
        ActionItemData(
          title: "Product &\nServices",
          imagePath: "assets/Product_services.png",
          showBadge: true,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(displayItems.length, (index) {
          return _buildActionTile(displayItems[index], index);
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
              width: 105,
              height: 130, // Uniform height for all tiles
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
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
                          const SizedBox(height: 8),
                          ic.Icon(
                            item.icon,
                            imagePath: item.imagePath,
                            size: 40,
                            color: item.iconColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text Area with fixed bottom alignment
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 2,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 11, // Adjusted for better fit
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (item.showBadge)
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

  ActionItemData({
    required this.title,
    this.icon,
    this.imagePath,
    this.iconColor,
    this.showBadge = false,
  });
}
