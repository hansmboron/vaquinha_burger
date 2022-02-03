import 'package:get/get_navigation/get_navigation.dart';
import 'package:vaquinha_burger_mobile/app/modules/splash/splash_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
