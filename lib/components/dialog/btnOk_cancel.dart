import 'package:base_flutter_framework/components/widget/button_no_icon.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:flutter/material.dart';

class ButtonOkCancel extends StatefulWidget {
  Function onclickOk;
  Function onclickCancel;

  ButtonOkCancel(
      {Key? key, required this.onclickOk, required this.onclickCancel})
      : super(key: key);

  @override
  _ButtonOkCancelState createState() => _ButtonOkCancelState();
}

class _ButtonOkCancelState extends State<ButtonOkCancel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: buttonNoIcon(
                  title: "OK",
                  colorBackground: ColorCommon.colorIconBlue,
                  textColor: ColorCommon.colorWhite,
                  onclick: widget.onclickOk,
                  padding: EdgeInsets.symmetric(vertical: 8)),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: buttonNoIcon(
                title: "Cancel",
                colorBackground: ColorCommon.colorIconRed,
                textColor: ColorCommon.colorWhite,
                onclick: widget.onclickCancel,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
