import 'dart:developer';
import 'package:flutter/material.dart';
import '../../components/molecules/fingerprint_login.dart';

class FingerprintLoginScreen extends StatefulWidget {
  const FingerprintLoginScreen({super.key});

  @override
  State<FingerprintLoginScreen> createState() => _FingerprintLoginScreenState();
}

class _FingerprintLoginScreenState extends State<FingerprintLoginScreen> {
  void handleCardClick() {
    log("Fingerprint login card clicked!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 137, 192),
      body: Center(
        child: FingerprintLogin(
          title: "Goodbye, Secure Text & Image",
          subtitle: "Hello, Digicert Security",
          imagePath: "assets/lock.png",
          width: MediaQuery.of(context).size.width * 0.9,
          onTap: handleCardClick,
        ),
      ),
    );
  }
}
