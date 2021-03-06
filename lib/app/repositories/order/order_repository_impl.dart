import 'dart:developer';

import 'package:vaquinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vaquinha_burger_mobile/app/models/order_pix_model.dart';

import 'package:vaquinha_burger_mobile/app/models/order_model.dart';

import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map(
            (shoppingCard) => {
              'quantity': shoppingCard.quantity,
              'productId': shoppingCard.product.id,
            },
          )
          .toList()
    });

    if (result.hasError) {
      log(
        'Erro ao reslizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao realizar pedido');
    }

    return OrderPix.fromMap(result.body);
  }
}
