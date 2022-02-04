import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final RxDouble _totalPrice = 0.0.obs;
  final RxInt _quantity = 1.obs;

  ProductModel get product => _product.value;

  double get totalPrice => _totalPrice.value;

  int get quantity => _quantity.value;

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<num>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });
  }
}
