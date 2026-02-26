import 'package:flutter/material.dart';
import '../atoms/glass_card.dart';

class Login extends StatelessWidget {
  final VoidCallback? onMPINLogin;
  final VoidCallback? onForgotMPIN;

  const Login({
    super.key,
    this.onMPINLogin,
    this.onForgotMPIN,
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
              child: const Text(
                "Or, login with mPIN",
                style: TextStyle(
                  color: Color(0xFF1565C0), // Primary blue
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
              child: const Text(
                "Forgot mPIN?",
                style: TextStyle(
                  color: Color(0xFF1565C0), // Primary blue
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
