import 'package:get/get_navigation/get_navigation.dart';
import 'package:vaquinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  static final routers = <GetPage>[
    GetPage(name: '/', page: () => const SplashPage())
  ];
}
