import 'package:flutter/material.dart';
import '../../components/molecules/scan.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF7289C0),
      body: Center(
        child: Scan(
          title: "Scan",
          subtitle: "",
          imagePath: "assets/Qr_scan.png",
          popupTitle: "Scan to Login",
          qrData: "https://example.com/login",
        ),
      ),
    );
  }
}
