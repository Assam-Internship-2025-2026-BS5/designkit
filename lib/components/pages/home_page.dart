import 'package:flutter/material.dart';
import 'dart:ui';
import '../organisms/header.dart';
import '../organisms/bottom_nav.dart';
import '../molecules/action_items.dart';
import '../molecules/primary_button.dart';
import '../molecules/scan.dart';
import '../molecules/inline_action_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/right_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Header(
                        onNotificationTap: () => debugPrint("Notification Tapped"),
                        onProfileTap: () => debugPrint("Profile/Customer ID Tapped"),
                      ),
                      const SizedBox(height: 100), // Space for floating QR Scan
                      // Features Section Re-integrated
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Scalloped Background with Blur
                          ClipPath(
                            clipper: ScallopedClipper(),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(minHeight: 450),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(color: Colors.transparent), // No standard border
                                ),
                              ),
                            ),
                          ),
                          // Content Section
                          CustomPaint(
                            painter: ScallopedBorderPainter(),
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(minHeight: 450),
                              child: Column(
                                children: [
                                  const SizedBox(height: 70),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(
                                      "Frequently used features & special offers at your fingertips",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF374151),
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  ActionItems(
                                    onItemTap: (item) => debugPrint("Action Tapped: ${item.title}"),
                                  ),
                                  const SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: PrimaryButton(
                                      onTap: () => debugPrint("Fingerprint Login Tapped"),
                                    ),
                                  ),
                                  InlineActionRow(
                                    onMPINLogin: () => debugPrint("mPIN Login Tapped"),
                                    onForgotMPIN: () => debugPrint("Forgot mPIN Tapped"),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          // Centered Floating QR Button
                          Positioned(
                            top: -65,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: () => debugPrint("QR Scan Floating Button Tapped"),
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 30,
                                        offset: const Offset(0, 15),
                                      ),
                                    ],
                                    border: Border.all(color: Colors.white, width: 3),
                                  ),
                                  child: const Scan(
                                    title: "Scan",
                                    imagePath: "assets/Qr_scan.png",
                                    width: 130,
                                    height: 130,
                                    textColor: Color(0xFF1E3A8A), // Using the deep blue for visibility
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        onNavTap: (label) => debugPrint("Navigation Tapped: $label"),
      ),
    );
  }
}

class ScallopedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 80; 
    double centerX = size.width / 2;
    double cornerRadius = 40.0;
    
    Path path = Path();
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    
    // Line to the start of the notch
    path.lineTo(centerX - radius - 30, 0);
    
    // Smooth S-curve into the semi-circle
    path.cubicTo(
      centerX - radius - 15, 0,
      centerX - radius - 5, 20,
      centerX - radius, 25
    );
    
    // Concave arc (the scallop)
    path.arcToPoint(
      Offset(centerX + radius, 25),
      radius: Radius.circular(radius + 10),
      clockwise: false,
    );
    
    // Smooth S-curve out
    path.cubicTo(
      centerX + radius + 5, 20,
      centerX + radius + 15, 0,
      centerX + radius + 30, 0
    );
    
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ScallopedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 80; 
    double centerX = size.width / 2;
    double cornerRadius = 40.0;

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    
    path.lineTo(centerX - radius - 30, 0);
    
    path.cubicTo(
      centerX - radius - 15, 0,
      centerX - radius - 5, 20,
      centerX - radius, 25
    );
    
    path.arcToPoint(
      Offset(centerX + radius, 25),
      radius: Radius.circular(radius + 10),
      clockwise: false,
    );
    
    path.cubicTo(
      centerX + radius + 5, 20,
      centerX + radius + 15, 0,
      centerX + radius + 30, 0
    );
    
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
