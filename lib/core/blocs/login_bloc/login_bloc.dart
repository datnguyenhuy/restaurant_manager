import 'dart:async';

import 'package:base_flutter_framework/repository/login_repository.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository _loginRepository;

  LoginBloc({required LoginRepository loginRepository})
      : assert(true),
        _loginRepository = loginRepository,
        super(HomeInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithApple) {
      // yield* mapLoginWithApple();
    } else if (event is LoginWithFacebook) {
      yield* mapLoginWithFacebook();
    } else if (event is LoginWithGmail) {
      yield* mapLoginWithGmail();
    } else if (event is CheckPassWord) {
      // yield* mapCheckPassWord(phone: event.phone, pass: event.pass);
    }
  }

  Stream<LoginState> mapLoginWithGmail() async* {
    // bool exitst = await _registerRepository.checkExist(email: email);
    // if (exitst != null) {
    //   yield ExistAccountState();
    // }
    yield HomeInitial();
    bool login = await _loginRepository.loginGoogle();
    if (login) {
      yield LoginSuccess();
    } else {
      yield LoginFaild(message: StringCommon.errorConnect);
    }
  }

  // Stream<LoginState> mapLoginWithApple() async* {
  //   // bool exitst = await _registerRepository.checkExist(email: email);
  //   // if (exitst != null) {
  //   //   yield ExistAccountState();
  //   // }
  //   yield HomeInitial();
  //   bool login = await _loginRepository.loginApple();
  //   if (login) {
  //     yield LoginSuccess();
  //   } else {
  //     yield LoginFaild(message: StringCommon.errorConnect);
  //   }
  // }

  Stream<LoginState> mapLoginWithFacebook() async* {
    yield HomeInitial();
    bool login = await _loginRepository.loginWithFacebook();
    if (login) {
      yield LoginSuccess();
    } else {
      yield LoginFaild(message: StringCommon.errorConnect);
    }
  }

  // Stream<LoginState> mapCheckPassWord(
  //     {required String phone, required String pass}) async* {
  //   yield HomeInitial();
  //   bool login = await _loginRepository.checkPass(userName: phone, pass: pass);

  //   yield CheckExistAccount(pass: pass, phone: phone, exits: login);
  // }

}
