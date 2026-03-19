import 'package:flutter/material.dart';

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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onLeftTap,
              mouseCursor: SystemMouseCursors.click,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  leftLabel,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: spacing),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onRightTap,
              mouseCursor: SystemMouseCursors.click,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  rightLabel,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
