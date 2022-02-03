import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/repositories/products/product_repository.dart';
import 'package:vaquinha_burger_mobile/app/repositories/products/product_repository_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.put(MenuController(productRepository: Get.find()));
  }
}
