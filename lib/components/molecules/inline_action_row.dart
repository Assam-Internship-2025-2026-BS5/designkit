import 'package:flutter/material.dart';
import '../atoms/glass_card.dart';

class InlineActionRow extends StatelessWidget {
  final VoidCallback? onMPINLogin;
  final VoidCallback? onForgotMPIN;
  final String mpinText;
  final String forgotMpinText;
  final Color textColor;

  const InlineActionRow({
    super.key,
    this.onMPINLogin,
    this.onForgotMPIN,
    this.mpinText = "Or, login with mPIN",
    this.forgotMpinText = "Forgot mPIN?",
    this.textColor = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            borderRadius: 12,
            opacity: 0.1,
            blur: 12,
            showShadow: false,
            child: GestureDetector(
              onTap: onMPINLogin,
              child: Text(
                mpinText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            borderRadius: 12,
            opacity: 0.1,
            blur: 12,
            showShadow: false,
            child: GestureDetector(
              onTap: onForgotMPIN,
              child: Text(
                forgotMpinText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
