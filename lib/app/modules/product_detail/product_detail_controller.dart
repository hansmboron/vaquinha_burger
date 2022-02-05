import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/models/product_model.dart';

import '../../core/services/shopping_card_service.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final RxDouble _totalPrice = 0.0.obs;
  final RxInt _quantity = 1.obs;
  final ShoppingCardService _shoppingCardService;
  final RxBool _alreadyAdded = false.obs;

  ProductDetailController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  ProductModel get product => _product.value;

  double get totalPrice => _totalPrice.value;

  int get quantity => _quantity.value;

  bool get alreadyAdded => _alreadyAdded.value;

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCard() {
    _shoppingCardService.addAndRemoveProductInShoopingCard(
      product,
      quantity: quantity,
    );
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<num>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoppingCard = _shoppingCardService.getById(product.id);

    if (productShoppingCard != null) {
      _quantity(productShoppingCard.quantity);
      _alreadyAdded(true);
    }
  }
}
