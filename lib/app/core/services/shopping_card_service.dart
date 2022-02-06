import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/models/product_model.dart';
import 'package:vaquinha_burger_mobile/app/models/shopping_card_model.dart';

import '../../models/shopping_card_model.dart';

class ShoppingCardService extends GetxService {
  final _shoopingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shoopingCard.values.toList();

  int get totalProducts => _shoopingCard.values.length;

  ShoppingCardModel? getById(int id) => _shoopingCard[id];

  double get totalValue {
    return _shoopingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue += shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  void addAndRemoveProductInShoopingCard(ProductModel product, {required int quantity}) {
    if (quantity == 0) {
      _shoopingCard.remove(product.id);
    } else {
      _shoopingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCardModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() => _shoopingCard.clear();
}
