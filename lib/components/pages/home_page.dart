import 'package:flutter/material.dart';
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
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(minHeight: 400),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              border: Border.all(color: Colors.white.withOpacity(0.3)),
                            ),
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
              BottomNav(
                onNavTap: (label) => debugPrint("Navigation Tapped: $label"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
