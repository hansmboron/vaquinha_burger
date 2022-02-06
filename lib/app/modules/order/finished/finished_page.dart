import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burger_mobile/app/models/order_pix_model.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo_rounded.png',
                    width: context.widthTransformer(reducedBy: 40),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Pedido realizado com sucesso, clique no botão abaixo para acessar o QRCode do pix',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  VaquinhaButton(
                    onPressed: () {
                      Get.toNamed('orders/pix', arguments: _orderPix);
                    },
                    label: 'PIX',
                    color: context.theme.primaryColorDark,
                    height: 35,
                    width: context.widthTransformer(reducedBy: 40),
                  ),
                  const Spacer(),
                  VaquinhaButton(
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                    label: 'FECHAR',
                    width: context.widthTransformer(reducedBy: 10),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
