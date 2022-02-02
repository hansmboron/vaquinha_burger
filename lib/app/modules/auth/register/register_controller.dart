import 'package:get/get.dart';
import 'package:vaquinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vaquinha_burger_mobile/app/core/mixins/mesages_mixin.dart';
import 'package:vaquinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final RxBool loading = false.obs;
  final message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }
}
