import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vaquinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vaquinha_burger_mobile/app/models/shopping_card_model.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService;

  final RxString _address = ''.obs;
  final RxString _cpf = ''.obs;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoopingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoopingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();
}
