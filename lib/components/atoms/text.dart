import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';

class Text extends m.StatefulWidget {
  final String text;
  final double fontSize;
  final m.Color color;
  final m.FontWeight fontWeight;
  final m.TextAlign textAlign;
  final int? maxLines;

  // New properties for border and input
  final bool showBorder;
  final bool isEditable;
  final String hintText;
  final double borderRadius;
  final m.Color fillColor;
  final m.Color borderColor;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final double? width;
  final m.ValueChanged<String>? onChanged;

  const Text({
    m.Key? key,
    required this.text,
    this.fontSize = 20,
    this.color = m.Colors.black,
    this.fontWeight = m.FontWeight.normal,
    this.textAlign = m.TextAlign.left,
    this.maxLines,
    this.showBorder = false,
    this.isEditable = false,
    this.hintText = '',
    this.borderRadius = 8,
    this.fillColor = const m.Color(0xFFE2E8F0),
    this.borderColor = m.Colors.black,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.width,
    this.onChanged,
  }) : super(key: key);

  @override
  m.State<Text> createState() => _TextState();
}

class _TextState extends m.State<Text> {
  late m.TextEditingController _controller;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = m.TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(Text oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text && _controller.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  m.Widget build(m.BuildContext context) {
    m.Widget textWidget;

    if (widget.isEditable) {
      textWidget = m.TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines ?? 1,
        style: m.TextStyle(
          fontSize: widget.fontSize,
          color: widget.color,
          fontWeight: widget.fontWeight,
        ),
        decoration: m.InputDecoration(
          hintText: widget.hintText,
          hintStyle: m.TextStyle(
            color: widget.color.withOpacity(0.5),
          ),
          border: m.InputBorder.none,
          isDense: true,
          contentPadding: widget.showBorder 
            ? const m.EdgeInsets.symmetric(horizontal: 16, vertical: 12)
            : m.EdgeInsets.zero,
          counterText: "",
        ),
      );
    } else {
      textWidget = m.Text(
        widget.text,
        maxLines: widget.maxLines,
        textAlign: widget.textAlign,
        overflow: widget.maxLines != null ? m.TextOverflow.ellipsis : null,
        style: m.TextStyle(
          fontSize: widget.fontSize,
          color: widget.color,
          fontWeight: widget.fontWeight,
        ),
      );
    }

    if (widget.showBorder) {
      return m.SizedBox(
        width: widget.width,
        child: m.MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: m.AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: widget.isEditable ? m.EdgeInsets.zero : const m.EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: m.BoxDecoration(
              color: _isHovering
                  ? widget.fillColor.withOpacity(0.9)
                  : widget.fillColor,
              borderRadius: m.BorderRadius.circular(widget.borderRadius),
              border: m.Border.all(
                color: widget.borderColor,
                width: 1.5,
              ),
            ),
            child: textWidget,
          ),
        ),
      );
    }

    return m.SizedBox(
      width: widget.width,
      child: textWidget,
    );
  }
}
