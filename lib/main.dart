import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/ui/vaquinha_ui.dart';
import 'package:vaquinha_burger_mobile/app/modules/splash/splash_page.dart';
import 'package:vaquinha_burger_mobile/app/routes/splash_routes.dart';

void main() {
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
      getPages: [
        ...SplashRoutes.routers,
      ],
      initialRoute: '/',
    );
  }
}
