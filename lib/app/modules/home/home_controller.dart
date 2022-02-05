import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vaquinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vaquinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vaquinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/menu/menu_page.dart';
import 'package:vaquinha_burger_mobile/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/order/shopping_card/shopping_card_page.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  final RxInt _tabIndex = 0.obs;
  final List _tabs = ['/menu', '/order/shooping_card', '/exit'];
  final ShoppingCardService _shoppingCardService;

  HomeController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCard => _shoppingCardService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRoute(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fade,
      );
    }
    if (settings.name == '/order/shooping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fade,
      );
    }
  }
}
