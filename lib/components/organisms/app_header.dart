import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String userName;
  final String customerId;
  final String logoPath;
  final double? width;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const AppHeader({
    super.key,
    this.userName = "MHONBENI NGULLIE",
    this.customerId = "******1010",
    this.logoPath = "assets/hdfc_logo.png",
    this.width,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFC7E2FE), // Light sky blue background matching the image
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          Image.asset(
            logoPath,
            height: 22,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Row(
              children: [
                const Icon(Icons.account_balance, color: Color(0xFF1E3A8A), size: 22),
                const SizedBox(width: 8),
                Text(
                  "HDFC BANK",
                  style: TextStyle(
                    color: const Color(0xFF1E3A8A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Cust ID $customerId",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                ],
              ),
              // Notification Icon
              GestureDetector(
                onTap: onNotificationTap,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFF97316), Color(0xFFFB923C), Color(0xFFFACC15)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
