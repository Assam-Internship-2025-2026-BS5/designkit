import 'dart:ui';
import 'package:flutter/material.dart';

class FingerprintLogin extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double width;
  final double height;
  final double blur;
  final double opacity;
  final VoidCallback? onTap;

  const FingerprintLogin({
    super.key,
    this.title = "Login with Fingerprint",
    this.subtitle = "",
    this.imagePath = "",
    this.width = 380,
    this.height = 56,
    this.blur = 0,
    this.opacity = 1.0,
    this.onTap,
  });

  @override
  State<FingerprintLogin> createState() => _FingerprintLoginState();
}

class _FingerprintLoginState extends State<FingerprintLogin> {
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
            gradient: const LinearGradient(
              colors: [Color(0xFF004C8F), Color(0xFF003366)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(widget.height / 2),
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
              const Icon(
                Icons.fingerprint,
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
