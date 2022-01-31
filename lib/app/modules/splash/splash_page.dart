import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_textfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const VaquinhaTextField(label: 'Email'),
          const SizedBox(height: 40),
          VaquinhaButton(
            label: 'Login',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
