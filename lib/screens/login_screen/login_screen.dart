import 'dart:async';

import 'package:base_flutter_framework/components/login/item_login_social.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/text_regular.dart';
import 'package:base_flutter_framework/core/blocs/login_bloc/login_bloc.dart';
import 'package:base_flutter_framework/repository/login_repository.dart';
import 'package:base_flutter_framework/screens/chat_ui/chat_ui_page.dart';
import 'package:base_flutter_framework/screens/home_main/home_main_page.dart';
import 'package:base_flutter_framework/screens/login_screen/login_page.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = LoginBloc(loginRepository: LoginRepository());

  Widget listButtonLogin() {
    return BlocListener(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          NavigatorCommon.navigatorRemoveUntil(
              context: context, goto: HomeMainPage());
        }
      },
      child: Column(
        children: [
          ItemLoginSocial(
              iconUrl: StringCommon.pathIconGoogle,
              onClick: () {
                _loginBloc.add(LoginWithGmail());
              },
              title: "Google",
              color: ColorCommon.colorRed),
          ItemLoginSocial(
              iconUrl: StringCommon.pathIconFacebook,
              onClick: () {
                _loginBloc.add(LoginWithFacebook());
              },
              title: "Facebook",
              color: ColorCommon.colorButtonFacebook),
          ItemLoginSocial(
              iconUrl: StringCommon.pathIconApple,
              onClick: () {},
              title: "Apple",
              color: ColorCommon.colorButtonApple),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        context: context,
        backgroundColor: Colors.white,
        child: Container(
          margin: EdgeInsets.only(
              top: DimensCommon.sizeHeight(context: context) * 0.2),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Center(
                  child: Image.asset(
                    StringCommon.pathBgLogoFlash,
                    height: 170,
                    width: 140,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              listButtonLogin(),
            ],
          ),
        ));
  }
}
