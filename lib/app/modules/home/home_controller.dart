import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vaquinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  final RxInt _tabIndex = 0.obs;
  final List _tabs = ['/menu', '/order/shooping_card', '/exit'];

  int get tabIndex => _tabIndex.value;

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
  }
}
