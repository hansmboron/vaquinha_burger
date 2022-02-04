import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_ui.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_appbar.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_button.dart';
import 'package:vaquinha_burger_mobile/app/models/product_model.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://dartweek.academiadoflutter.com.br/images${controller.product.image}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return PlusMinusBox(
                      minusCallback: controller.removeProduct,
                      plusCallback: controller.addProduct,
                      price: controller.product.price,
                      quantity: controller.quantity,
                    );
                  }),
                  const Divider(),
                  ListTile(
                    title: const Text('Total', style: VaquinaUI.textBold),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: VaquinhaButton(onPressed: () {}, label: 'ADICIONAR'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
