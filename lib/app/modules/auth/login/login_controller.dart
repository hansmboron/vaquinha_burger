import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaquinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vaquinha_burger_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:vaquinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vaquinha_burger_mobile/app/core/mixins/mesages_mixin.dart';
import 'package:vaquinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final RxBool _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);
      _loading.toggle();
      _message(MessageModel(
        title: 'Sucesso',
        message: 'Login efetuado com sucesso',
        type: MessageType.info,
      ));
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('E-mail ou Senha inválidos', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'E-mail ou Senha inválidos',
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao realizar login',
        type: MessageType.error,
      ));
    }
  }
}
