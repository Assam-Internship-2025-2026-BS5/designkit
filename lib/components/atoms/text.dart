import 'package:flutter/material.dart' as m;

class Text extends m.StatelessWidget {
  final String text;
  final double fontSize;
  final m.Color color;
  final m.FontWeight fontWeight;
  final m.TextAlign textAlign;
  final int? maxLines;

  const Text({
    m.Key? key,
    required this.text,
    this.fontSize = 20,
    this.color = m.Colors.black,
    this.fontWeight = m.FontWeight.normal,
    this.textAlign = m.TextAlign.left,
    this.maxLines,
  }) : super(key: key);

  @override
  m.Widget build(m.BuildContext context) {
    return m.Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? m.TextOverflow.ellipsis : null,
      style: m.TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
