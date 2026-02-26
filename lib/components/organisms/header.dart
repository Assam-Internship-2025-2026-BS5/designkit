import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userName;
  final String customerId;
  final String logoPath;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const Header({
    super.key,
    this.userName = "MHONBENI NGULLIE",
    this.customerId = "******1010",
    this.logoPath = "assets/hdfc_logo.png",
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: () => debugPrint("Logo Tapped"),
                child: Image.asset(
                  logoPath,
                  height: 35,
                ),
              ),
              // Notification Icon
              GestureDetector(
                onTap: onNotificationTap,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFF97316), Color(0xFFFACC15)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // User Info
          GestureDetector(
            onTap: onProfileTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Text(
                  userName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Cust ID $customerId",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
