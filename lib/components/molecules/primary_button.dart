import 'dart:ui';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData icon;
  final double width;
  final double height;
  final double? borderRadius;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;

  const PrimaryButton({
    super.key,
    this.title = "Login with Fingerprint",
    this.subtitle = "",
    this.imagePath = "",
    this.icon = Icons.fingerprint,
    this.width = 380,
    this.height = 48,
    this.gradientColors,
    this.borderRadius = 24.0,
    this.onTap,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradientColors ?? [const Color(0xFF004C8F), const Color(0xFF003366)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              widget.imagePath.isNotEmpty
                  ? Image.asset(
                      widget.imagePath,
                      width: 28,
                      height: 28,
                      color: Colors.white,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 28,
                      ),
                    )
                  : Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 28,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
