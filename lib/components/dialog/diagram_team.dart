import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

Widget diagram(
      {required int numberOne,
      required int numberTwo,
      required int numberThree,
      required int numberFour,
      void Function()? onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 116,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                circleNumber(number: numberOne, colorBg: ColorCommon.colorNumber),
                dash(),
                circleNumber(
                    number: numberTwo, colorBg: ColorCommon.colorIconRed),
                dash(),
                circleNumber(
                    number: numberThree, colorBg: ColorCommon.colorLightBlue),
                dash(),
                circleNumber(number: numberFour, colorBg: ColorCommon.colorPink),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget circleNumber({required int number, required Color colorBg}) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: colorBg,
      child: Text(
        number.toString(),
        style: TextAppStyle().styleVeryBold20White(),
      ),
    );
  }

  Widget dash() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 17,
      height: 3,
      decoration: BoxDecoration(
          color: ColorCommon.colorDash,
          borderRadius: BorderRadius.circular(50)),
    );
  }
