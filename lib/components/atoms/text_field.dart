import 'dart:ui';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';

class TextField extends m.StatefulWidget {
  final String hintText;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final double? width;

  final double fontSize;
  final m.Color textColor;
  final m.FontWeight fontWeight;
  final double borderRadius;
  final Color fillColor;

  const TextField({
    super.key,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.width,
    this.fontSize = 22,
    this.textColor = const m.Color.fromARGB(255, 0, 0, 0),
    this.fontWeight = m.FontWeight.w500,
    this.borderRadius = 30,
    this.fillColor = const m.Color(0xFFE2E8F0),
  });

  @override
  m.State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends m.State<TextField> {
  final m.TextEditingController _controller = m.TextEditingController();
  String? _errorText;
  bool _isHovering = false;

  void _validate(String value) {
    m.debugPrint("Field Input: $value");

    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
  }

  bool get hasError => _errorText != null;

  @override
  m.Widget build(m.BuildContext context) {
    return m.SizedBox(
      width: widget.width,
      child: m.Column(
        mainAxisSize: m.MainAxisSize.min,
        crossAxisAlignment: m.CrossAxisAlignment.center, // Center the column content
        children: [
          m.MouseRegion(
            onEnter: (_) => setState(() => _isHovering = true),
            onExit: (_) => setState(() => _isHovering = false),
            child: m.AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: m.BoxDecoration(
                color: _isHovering
                    ? widget.fillColor.withOpacity(0.9)
                    : widget.fillColor,
                borderRadius: m.BorderRadius.circular(widget.borderRadius),
                border: m.Border.all(
                  color: hasError
                      ? m.Colors.red.withOpacity(0.5)
                      : widget.fillColor.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: m.TextField(
                controller: _controller,
                obscureText: false,
                inputFormatters: widget.inputFormatters,
                maxLength: widget.maxLength,
                onChanged: _validate,
                textAlign: m.TextAlign.center,
                style: m.TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                  fontWeight: widget.fontWeight,
                ),
                textAlignVertical: m.TextAlignVertical.center,
                decoration: m.InputDecoration(
                  counterText: "",
                  hintText: widget.hintText,
                  hintStyle: m.TextStyle(
                    color: widget.textColor.withOpacity(0.7),
                    fontSize: widget.fontSize - 2,
                  ),
                  contentPadding: const m.EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  border: m.InputBorder.none,
                ),
              ),
            ),
          ),
          if (hasError) ...[
            const m.SizedBox(height: 8),
            m.Padding(
              padding: const m.EdgeInsets.symmetric(horizontal: 20),
              child: m.Text(
                _errorText!,
                textAlign: m.TextAlign.center,
                style: const m.TextStyle(
                  color: m.Colors.redAccent,
                  fontSize: 14,
                  fontWeight: m.FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
