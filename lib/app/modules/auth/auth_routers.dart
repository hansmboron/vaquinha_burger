import 'package:get/get_navigation/get_navigation.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/register/register_page.dart';

import 'login/login_page.dart';

class AuthRouters {
  AuthRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
