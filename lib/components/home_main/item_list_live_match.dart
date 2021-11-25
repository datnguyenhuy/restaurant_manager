import 'package:base_flutter_framework/components/home_main/icon_before_data.dart';
import 'package:base_flutter_framework/components/home_main/item_list_history_match.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/core/models/live_match_model.dart';
import 'package:base_flutter_framework/screens/final_match.dart/final_match_screen.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header.dart';
import 'information_match.dart';

Widget itemListLiveMatch({required LiveMatchModel liveMatch, required BuildContext context}) {
  return Container(
    child: Column(
      children: [
        header(liveMatch: liveMatch),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              informationMatch(
                  location: liveMatch.location,
                  time: liveMatch.time,
                  money: liveMatch.money, context: context),
              result(
                  scoreHome: liveMatch.scoreHome,
                  scoreAway: liveMatch.scoreAway)
            ],
          ),
        )
      ],
    ),
  );
}

Widget result({
  required int scoreHome,
  required int scoreAway,
}) {
  return Container(
    child: Column(
      children: [
        itemResult(
            title: "HOME",
            score: scoreHome,
            colorBackground: ColorCommon.colorIconBlue,
            colorTitle: ColorCommon.colorWhite,
            colorDot: ColorCommon.colorIconRed),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: itemResult(
              title: "AWAY",
              score: scoreAway,
              colorBackground: HexColor("FF96AD"),
              colorTitle: ColorCommon.colorIconBlue,
              colorDot: ColorCommon.colorIconBlue),
        )
      ],
    ),
  );
}

Widget itemResult(
    {required String title,
    required int score,
    Color? colorBackground,
    Color? colorTitle,
    Color? colorDot}) {
  return Container(
    height: (score ~/ 5 + 1) * 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: colorBackground,
    ),
    child: Row(
      children: [
        Container(
          width: 70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: colorTitle,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      score.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.white,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      score.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colorDot,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: (score ~/ 5 + 1) * 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 20.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                ),
                child: index < score
                    ? Image.asset(
                        StringCommon.pathIconChampionLeague,
                        color: colorDot,
                        scale: 1.5,
                      )
                    : Image.asset(
                        StringCommon.pathIconChampionLeague,
                        color: Colors.grey[200],
                        scale: 1.5,
                      ),
              );
            },
          ),
        )
      ],
    ),
  );
}
