part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
  const LoginState();
}

class HomeInitial extends LoginState {
  const HomeInitial();
}

// ignore: must_be_immutable
class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginFaild extends LoginState {
  final String message;
  const LoginFaild({required this.message});
}

class VetifySuccess extends LoginState {
  final String provider;
  const VetifySuccess({required this.provider});
}

class SendCodeEmailSucces extends LoginState {
  const SendCodeEmailSucces();
}

class VetifyFailed extends LoginState {
  final String message;
  const VetifyFailed({required this.message});
}

// ignore: must_be_immutable
class CheckExistAccount extends LoginState {
  String phone;
  String pass;
  bool exits;
  CheckExistAccount(
      {required this.pass, required this.phone, required this.exits});
}
