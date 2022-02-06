import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/modules/order/finished/finished_page.dart';

class OrdersRouters {
  OrdersRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => const FinishedPage(),
    ),
  ];
}
