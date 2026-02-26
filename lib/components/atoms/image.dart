import 'package:flutter/material.dart' as m;

class Image extends m.StatelessWidget {
  final double width;
  final double height;
  final double offsetX;
  final double offsetY;
  final bool showShadow;

  const Image({
    super.key,
    this.width = 240.0,
    this.height = 31.0,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
    this.showShadow = false,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.MouseRegion(
      cursor: m.SystemMouseCursors.click,
      child: m.Transform.translate(
        offset: m.Offset(offsetX, offsetY),
        child: m.Container(
          width: width,
          height: height,
          alignment: m.Alignment.center,
          decoration: m.BoxDecoration(
            boxShadow: showShadow
                ? [
                    m.BoxShadow(
                      color: m.Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const m.Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: m.FittedBox(
            fit: m.BoxFit.contain,
            alignment: m.Alignment.center,
            child: m.Row(
              mainAxisSize: m.MainAxisSize.min,
              mainAxisAlignment: m.MainAxisAlignment.center,
              crossAxisAlignment: m.CrossAxisAlignment.center,
              children: [
                m.Image.asset(
                  'assets/hdfc_logo.png',
                  height: 31.0,
                  fit: m.BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const m.Icon(m.Icons.broken_image, color: m.Colors.white24, size: 24),
                ),
                const m.SizedBox(width: 20),
                m.Image.asset(
                  'assets/now_logo.png',
                  height: 26.0,
                  fit: m.BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const m.Icon(m.Icons.broken_image, color: m.Colors.white24, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
