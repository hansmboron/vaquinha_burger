import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_textfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        VaquinhaTextField(label: 'Email'),
      ],
    ));
  }
}
