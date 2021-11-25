import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/core/models/live_match_model.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:flutter/material.dart';

Widget header({required LiveMatchModel liveMatch}) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(right: 10),
        child: circleWidgetBordered(
            child: liveMatch.avatar ?? Image.asset(StringCommon.pathAvatarCommon),
            maxRadius: 22.5,
            widthBorder: 0,
            colorBorder: ColorCommon.colorButton,
            background: ColorCommon.colorIconRed),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              liveMatch.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ColorCommon.colorText),
            ),
            boardResult(
                scoreHome: liveMatch.scoreHome, scoreAway: liveMatch.scoreAway)
          ],
        ),
      )
    ],
  );
}

Widget boardResult({required int scoreHome, required int scoreAway}) {
  return Container(
    width: 150,
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: ColorCommon.colorBlack, blurRadius: 0.25)],
        borderRadius: BorderRadius.circular(50),
        color: HexColor("FFF5FD")),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          child: Container(child: Icon(Icons.person)),
          backgroundColor: ColorCommon.colorIconBlue,
          maxRadius: 14,
        ),
        Text(
          scoreHome.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: ColorCommon.colorNumber),
        ),
        Text(
          "vs",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorCommon.colorIconRed,
              fontSize: 10),
        ),
        Text(
          scoreAway.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: ColorCommon.colorNumber),
        ),
        CircleAvatar(
          child: Container(child: Icon(Icons.person)),
          backgroundColor: ColorCommon.colorIconRed,
          maxRadius: 14,
        )
      ],
    ),
  );
}
