import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burger_mobile/app/core/bindings/application_bindings.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_ui.dart';
import 'package:vaquinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vaquinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vaquinha_burger_mobile/app/routes/orders_routers.dart';
import 'package:vaquinha_burger_mobile/app/routes/product_routers.dart';
import 'package:vaquinha_burger_mobile/app/routes/splash_routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: VaquinaUI.theme,
      debugShowCheckedModeBanner: false,
      title: 'Vaquinha Burger',
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashRoutes.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
      initialRoute: '/',
    );
  }
}
