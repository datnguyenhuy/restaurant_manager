part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginWithFacebook extends LoginEvent {
  const LoginWithFacebook();
}

class LoginWithGmail extends LoginEvent {
  const LoginWithGmail();
}

class LoginWithApple extends LoginEvent {
  const LoginWithApple();
}

class VerifyPhoneSms extends LoginEvent {
  final String phoneNumber;
  VerifyPhoneSms({required this.phoneNumber});
}

class CheckPassWord extends LoginEvent {
  String phone;
  // String name;
  String pass;
  CheckPassWord({required this.pass, required this.phone});
}
