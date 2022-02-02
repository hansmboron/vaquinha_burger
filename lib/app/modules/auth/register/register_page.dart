import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_state.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_textfield.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends VaquinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
              key: _formKey,
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
                  VaquinhaTextField(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome Obrigatório'),
                      Validatorless.min(3, 'Pelo menos 3 caractéres'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  VaquinhaTextField(
                    label: 'Email',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email Obrigatório'),
                      Validatorless.email('Email Inválido'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  VaquinhaTextField(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatório'),
                      Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  VaquinhaTextField(
                    label: 'Confirmar Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar Senha Obrigatório'),
                      Validatorless.compare(_passwordEC, 'Senhas não correspondem'),
                    ]),
                  ),
                  const SizedBox(height: 40),
                  VaquinhaButton(
                    onPressed: () {
                      final formValid = _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        controller.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      }
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
