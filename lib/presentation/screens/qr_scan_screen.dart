import 'package:flutter/material.dart';
import '../../components/molecules/qr_scan.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF7289C0),
      body: Center(
        child: QRScan(
          title: "QR Scan",
          subtitle: "",
          imagePath: "assets/Qr_scan.png",
          popupTitle: "Scan to Login",
          qrData: "https://example.com/login",
        ),
      ),
    );
  }
}
