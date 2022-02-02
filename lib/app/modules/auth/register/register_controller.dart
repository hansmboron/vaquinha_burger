import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vaquinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin {
  final AuthRepository _authRepository;

  final RxBool loading = false.obs;

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(loading);
    super.onInit();
  }

  void qualquer() {
    loading.toggle();
    Future.delayed(const Duration(seconds: 2), () => loading.toggle());
  }
}
