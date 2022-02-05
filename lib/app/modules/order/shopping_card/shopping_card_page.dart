import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  ShoppingCardPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: PlusMinusBox(
                                label: 'X-TUDAO',
                                calculateTotal: true,
                                elevated: true,
                                backgroundColor: Colors.white,
                                quantity: 1,
                                price: 12.99,
                                minusCallback: () {},
                                plusCallback: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: PlusMinusBox(
                                label: 'X-TUDAO',
                                calculateTotal: true,
                                elevated: true,
                                backgroundColor: Colors.white,
                                quantity: 1,
                                price: 12.99,
                                minusCallback: () {},
                                plusCallback: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: PlusMinusBox(
                                label: 'X-TUDAO',
                                calculateTotal: true,
                                elevated: true,
                                backgroundColor: Colors.white,
                                quantity: 1,
                                price: 12.99,
                                minusCallback: () {},
                                plusCallback: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total do pedido',
                              style: context.textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              FormatterHelper.formatCurrency(200),
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const _AddressField(),
                        const _CpfField(),
                        const Spacer(),
                        SizedBox(
                          child: VaquinhaButton(
                            label: 'FINALIZAR',
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Endereço de Enrega',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {},
          validator: Validatorless.required('Endereço Obrigatório'),
          decoration: const InputDecoration(
            hintText: 'Digite o Endereço',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CPF',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {},
          validator: Validatorless.multiple([
            Validatorless.required('CPF Obrigatório'),
            Validatorless.email('Email Inválido')
          ]),
          decoration: const InputDecoration(
            hintText: 'Digite o CPF',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
