import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/rest_client/rest_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}