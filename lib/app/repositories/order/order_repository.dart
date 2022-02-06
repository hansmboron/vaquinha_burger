import '../../models/order_model.dart';
import '../../models/order_pix_model.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
