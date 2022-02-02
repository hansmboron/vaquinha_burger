import 'package:get/get_navigation/get_navigation.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/login/login_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:vaquinha_burger_mobile/app/modules/auth/register/register_page.dart';

import '../modules/auth/login/login_page.dart';

class AuthRouters {
  AuthRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
