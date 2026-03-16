import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userName;
  final String customerId;
  final String logoPath;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;
  final Color textColor;
  final List<Color> notificationGradient;

  const Header({
    super.key,
    required this.userName,
    required this.customerId,
    required this.logoPath,
    this.onNotificationTap,
    this.onProfileTap,
    this.textColor = Colors.black,
    this.notificationGradient = const [Color(0xFFF97316), Color(0xFFFACC15)],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Row
          GestureDetector(
            onTap: () => debugPrint("Logo Tapped"),
            child: SizedBox(
              width: 150,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  logoPath,
                  height: 22,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Text(
                    "BRAND LOGO",
                    style: TextStyle(
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // User Info & Notification Integrated
          GestureDetector(
            onTap: onProfileTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          userName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onNotificationTap,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: notificationGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // ID Row
          Row(
            children: [
              Text(
                "ID $customerId",
                style: TextStyle(
                  fontSize: 13,
                  color: textColor.withOpacity(0.6),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: textColor.withOpacity(0.54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
