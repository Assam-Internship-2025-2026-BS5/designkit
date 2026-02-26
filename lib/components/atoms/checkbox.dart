import 'package:flutter/material.dart';

class Checkbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Color activeColor;
  final Color checkColor;

  const Checkbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor = const Color(0xFF2938AD),
    this.checkColor = Colors.white,
  });

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.value),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: widget.value ? widget.activeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.value ? widget.activeColor : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: widget.value
                  ? Icon(
                      Icons.check,
                      size: 18,
                      color: widget.checkColor,
                    )
                  : null,
            ),
            if (widget.label != null) ...[
              const SizedBox(width: 8),
              Text(
                widget.label!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
