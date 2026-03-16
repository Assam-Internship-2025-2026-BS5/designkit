import 'dart:ui';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback? onTap;
  final double width;
  final double height;
  final String text;
  final bool disabled;
  final Color buttonColor;
<<<<<<< Updated upstream
  final bool isSingleColor;
=======
  final bool showOutline;
>>>>>>> Stashed changes
  final double opacity;

  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final bool showFingerprint;

  const Button({
    super.key,
    this.onTap,
    this.width = 321,
    this.height = 61,
    required this.text,
    this.disabled = false,
    this.buttonColor = const Color(0xFF5371F9),
<<<<<<< Updated upstream
    this.isSingleColor = false,
    this.opacity = 0.8,
=======
    this.showOutline = true,
    this.opacity = 0.3,
>>>>>>> Stashed changes
    this.textColor = Colors.white,
    this.fontSize = 22,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 20,
    this.showFingerprint = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.disabled) {
      _animationController.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.disabled) {
      _animationController.reverse();
      widget.onTap?.call();
    }
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
<<<<<<< Updated upstream
              color: widget.isSingleColor
                  ? widget.buttonColor.withOpacity(widget.opacity)
                  : null,
              gradient: widget.isSingleColor
                  ? null
                  : LinearGradient(
                      colors: [
                        widget.buttonColor.withOpacity(widget.opacity),
                        widget.buttonColor.withOpacity(widget.opacity * 0.5),
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
=======
              gradient: LinearGradient(
                colors: [
                  widget.buttonColor.withOpacity(widget.opacity),
                  widget.buttonColor.withOpacity(widget.opacity * 0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: widget.showOutline
                  ? Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    )
                  : null,
>>>>>>> Stashed changes
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
<<<<<<< Updated upstream
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    letterSpacing: 0.5,
                  ),
                ),
                if (widget.showFingerprint) ...[
                  const SizedBox(width: 12),
                  Icon(
                    Icons.fingerprint,
                    color: widget.textColor,
                    size: widget.fontSize * 1.4,
                  ),
                ],
              ],
=======
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                letterSpacing: 0.5,
              ),
>>>>>>> Stashed changes
            ),
          ),
        ),
      ),
    );
  }
}
