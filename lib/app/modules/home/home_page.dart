import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/icon_badge.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/widgets/vaquinha_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VaquinhaAppbar(),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRoute,
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                number: controller.totalProductsInShoppingCard,
                icon: Icons.shopping_cart_rounded,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app_rounded),
              label: 'Sair',
            ),
          ],
        );
      }),
    );
  }
}
