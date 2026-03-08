import 'package:flutter/material.dart';
import '../atoms/glass_container.dart';
import '../molecules/primary_button.dart';
import '../molecules/inline_action_row.dart';

class AuthSection extends StatelessWidget {
  final String fingerprintTitle;
  final String mpinText;
  final String forgotMpinText;
  final VoidCallback? onFingerprintTap;
  final VoidCallback? onMPINTap;
  final VoidCallback? onForgotMPINTap;
  final double width;

  const AuthSection({
    super.key,
    this.fingerprintTitle = "Login with Fingerprint",
    this.mpinText = "Or, login with mPIN",
    this.forgotMpinText = "Forgot mPIN?",
    this.onFingerprintTap,
    this.onMPINTap,
    this.onForgotMPINTap,
    this.width = 450,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      borderRadius: BorderRadius.circular(60),
      opacity: 0.10,
      blur: 25,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              title: fingerprintTitle,
              onTap: onFingerprintTap,
              width: width - 48,
              height: 48,
              borderRadius: 24, // Fully rounded edges
            ),
            const SizedBox(height: 8),
            InlineActionRow(
              mpinText: mpinText,
              forgotMpinText: forgotMpinText,
              onMPINLogin: onMPINTap,
              onForgotMPIN: onForgotMPINTap,
              textColor: const Color(0xFF1E3A8A),
            ),
          ],
        ),
      ),
    );
  }
}
