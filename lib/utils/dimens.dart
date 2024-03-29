import 'package:flutter/material.dart';

class DimensCommon {
  static double fontSizeBig = 18;
  static double fontMediumBig = 16;
  static double fontSizeVeryBig = 38;
  static double fontSizeMediumBig = 30;
  static double fontSizeSmallBig = 20;
  static double fontSizeMedium = 15;
  static double fontSizeSmall = 13;
  static double fontSizeMediumSmall = 13;
  static double fontSizeVerySmall = 11;
  static double fontSizeMaxSmall = 9;

  static double fontSizeMaxBig = 30;

  static double fontSizeIconSmall = 16;
  static double fontSizeIconMedium = 18;
  static double fontSizeIconBig = 20;

  static double sizeBackButton = 50;

  static double sizeWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double sizeHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  static double paddingTop({required BuildContext context}) {
    return MediaQuery.of(context).padding.top;
  }

  static double paddingBottom({required BuildContext context}) {
    return MediaQuery.of(context).padding.bottom;
  }

  static EdgeInsets paddingCommon({required BuildContext context}) {
    return EdgeInsets.only(
        top: paddingTop(context: context),
        bottom: paddingBottom(context: context));
  }

  static double fontSizeScaleFlowLeght(String name,
      {required double leghtScale, required double fontDefault}) {
    return fontDefault - ((name.length / leghtScale) * 2);
  }

  static Decoration shadowBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }
}
