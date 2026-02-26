import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';

class TextField extends m.StatefulWidget {
  final String hintText;
  final String? Function(String)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;

  const TextField({
    super.key,
    required this.hintText,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.width,
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
        crossAxisAlignment: m.CrossAxisAlignment.start,
        children: [
          m.MouseRegion(
            onEnter: (_) => setState(() => _isHovering = true),
            onExit: (_) => setState(() => _isHovering = false),
            child: m.AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: m.BoxDecoration(
                color: _isHovering
                    ? const m.Color.fromARGB(255, 27, 27, 27).withOpacity(0.05)
                    : const m.Color(0x1FFFFFFF),
                borderRadius: m.BorderRadius.circular(30), // Pill shape
                border: m.Border.all(
                  color: hasError ? m.Colors.red : m.Colors.white.withOpacity(0.8),
                  width: 1.5,
                ),
              ),
              child: m.TextField(
                controller: _controller,
                obscureText: false,
                maxLength: widget.maxLength,
                inputFormatters: widget.inputFormatters,
                onChanged: _validate,
                style: const m.TextStyle(
                  fontSize: 22,
                  color: m.Color.fromARGB(255, 0, 0, 0),
                  fontWeight: m.FontWeight.w500,
                ),
                textAlignVertical: m.TextAlignVertical.center,
                decoration: m.InputDecoration(
                  counterText: "",
                  hintText: widget.hintText,
                  hintStyle: m.TextStyle(
                    color: const m.Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    fontSize: 20,
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
              padding: const m.EdgeInsets.only(left: 20),
              child: m.Text(
                _errorText!,
                style: const m.TextStyle(
                  color: m.Colors.red,
                  fontSize: 17,
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
