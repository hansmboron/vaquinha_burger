import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_ui.dart';

class VaquinhaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double height;
  final Color? color;

  const VaquinhaButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.width = double.maxFinite,
    this.height = 50,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: VaquinaUI.textBold.copyWith(fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}
