import 'package:flutter/material.dart';
import '../atoms/glass_container.dart';
import '../molecules/primary_button.dart';

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
      borderRadius: BorderRadius.circular(40),
      opacity: 0.15,
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
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onMPINTap,
                    child: Text(
                      mpinText,
                      style: const TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onForgotMPINTap,
                    child: Text(
                      forgotMpinText,
                      style: const TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
