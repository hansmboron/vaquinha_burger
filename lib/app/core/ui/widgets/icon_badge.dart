import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_ui.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    Key? key,
    required this.number,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 8,
              backgroundColor: const Color.fromARGB(220, 204, 17, 4),
              child: Text(
                number.toString(),
                style: VaquinaUI.textBold.copyWith(
                  fontSize: 9,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
