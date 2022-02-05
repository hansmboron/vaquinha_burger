import 'package:flutter/material.dart';

class VaquinhaRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double fontSize;

  const VaquinhaRoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: fontSize,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.white,
      ),
    );
  }
}
