import 'package:flutter/material.dart' hide Text, Checkbox;
import '../../components/atoms/text.dart' as atom;
import '../../components/atoms/checkbox.dart' as atom;

class TextTestScreen extends StatefulWidget {
  const TextTestScreen({super.key});

  @override
  State<TextTestScreen> createState() => _TextTestScreenState();
}

class _TextTestScreenState extends State<TextTestScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const atom.Text(
              text: "Welcome to HDFC Bank",
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 243, 117, 33),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            atom.Checkbox(
              value: _isChecked,
              label: "Accept Terms & Conditions",
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
                debugPrint("Checkbox state: $_isChecked");
              },
            ),
          ],
        ),
      ),
    );
  }
}
