import 'package:flutter/material.dart';
import '../atoms/glass_card.dart';

class InlineActionRow extends StatelessWidget {
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final String leftLabel;
  final String rightLabel;
  final Color textColor;
  final double fontSize;
  final double spacing;
  final EdgeInsets padding;

  const InlineActionRow({
    super.key,
    this.onLeftTap,
    this.onRightTap,
    required this.leftLabel,
    required this.rightLabel,
    this.textColor = const Color(0xFF1565C0),
    this.fontSize = 14,
    this.spacing = 80,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onLeftTap,
            child: Text(
              leftLabel,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
          SizedBox(width: spacing),
          GestureDetector(
            onTap: onRightTap,
            child: Text(
              rightLabel,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
