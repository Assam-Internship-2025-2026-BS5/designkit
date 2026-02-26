import 'dart:ui';
import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  final String title;
  final String subtitle;
  final String popupTitle;
  final String qrData;
  final String? imagePath;
  final IconData icon;
  final Color accentColor;
  final Color textColor;
  final double width;
  final double height;
  final double blur;
  final double opacity;
  final VoidCallback? onTap;

  const Scan({
    super.key,
    required this.title,
    this.subtitle = "",
    this.popupTitle = "Scan Code",
    this.qrData = "",
    this.imagePath,
    this.icon = Icons.qr_code_2,
    this.accentColor = const Color(0xFF1E3A8A),
    this.textColor = const Color(0xFF1E3A8A),
    this.width = 484,
    this.height = 180,
    this.blur = 15,
    this.opacity = 0.2,
    this.onTap,
  });

  void _showQrPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black26,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    popupTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: imagePath != null
                        ? Image.asset(imagePath!, width: 180, height: 180)
                        : Icon(icon, size: 180, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Dismiss",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () => _showQrPopup(context),
        borderRadius: BorderRadius.circular(width / 2),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconTile(),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconTile() {
    return imagePath != null
        ? Image.asset(imagePath!, width: 45, height: 45)
        : Icon(icon, size: 45, color: accentColor);
  }
}
