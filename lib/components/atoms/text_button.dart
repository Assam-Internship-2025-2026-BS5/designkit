import 'package:flutter/material.dart' as m;

class TextButton extends m.StatefulWidget {
  final String text;
  final m.VoidCallback onPressed;
  final m.Color color;
  final double fontSize;
  final m.FontWeight fontWeight;
  final bool underline;

  const TextButton({
    m.Key? key,
    required this.text,
    required this.onPressed,
    this.color = m.Colors.blue,
    this.fontSize = 16,
    this.fontWeight = m.FontWeight.normal,
    this.underline = false,
  }) : super(key: key);

  @override
  m.State<TextButton> createState() => _TextButtonState();
}

class _TextButtonState extends m.State<TextButton> {
  bool _isHovering = false;

  @override
  m.Widget build(m.BuildContext context) {
    return m.MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: m.SystemMouseCursors.click,
      child: m.GestureDetector(
        onTap: widget.onPressed,
        child: m.AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: m.TextStyle(
            color: _isHovering ? widget.color.withOpacity(0.7) : widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            decoration: widget.underline || _isHovering
                ? m.TextDecoration.underline
                : m.TextDecoration.none,
          ),
          child: m.Text(widget.text),
        ),
      ),
    );
  }
}
