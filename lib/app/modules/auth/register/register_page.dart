import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o  seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 30),
                  VaquinhaTextField(label: 'Nome'),
                  const SizedBox(height: 30),
                  VaquinhaTextField(label: 'Email'),
                  const SizedBox(height: 30),
                  VaquinhaTextField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  VaquinhaTextField(
                    label: 'Confirmar Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  VaquinhaButton(
                    onPressed: () {
                      Get.back();
                    },
                    label: 'CADASTRAR',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
