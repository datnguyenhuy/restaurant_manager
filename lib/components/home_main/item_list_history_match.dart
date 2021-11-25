import 'package:base_flutter_framework/core/models/live_match_model.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import 'header.dart';
import 'information_match.dart';
import 'item_list_live_match.dart';

Widget itemListHistoryMatch(
    {required LiveMatchModel liveMatch, required BuildContext context}) {
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
                  money: liveMatch.money,
                  context: context),
              score(
                  scoreHome: liveMatch.scoreHome,
                  scoreAway: liveMatch.scoreAway)
            ],
          ),
        )
      ],
    ),
  );
}

Widget score({required int scoreHome, required int scoreAway}) {
  return Container(
    child: Column(
      children: [
        itemScore(
            title: "HOME",
            score: scoreHome,
            colorBackground: ColorCommon.colorIconBlue,
            colorDot: Colors.green),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: itemScore(
              title: "AWAY",
              score: scoreAway,
              colorBackground: HexColor("FF96AD"),
              colorDot: ColorCommon.colorIconRed),
        )
      ],
    ),
  );
}

Widget itemScore(
    {required String title,
    required int score,
    Color? colorBackground,
    Color? colorDot}) {
  return Container(
    height: (score ~/ 5 + 1) * 35,
    width: 320,
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
                Text(title.substring(0, 1),
                    style: TextAppStyle().styleBold25White()),
                Text(title.substring(1, title.length),
                    style: TextAppStyle().styleBold15White()),
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
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: index < score
                      ? Container(
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorDot,
                          ),
                        )
                      : SizedBox.shrink());
            },
          ),
        )
      ],
    ),
  );
}

Widget winDrawLow({
  required String title,
  required Color colorMain,
}) {
  return Container(
    child: Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(height: 9, width: 16),
              Container(
                height: 9,
                width: 7,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                    color: ColorCommon.colorBoxWin),
              )
            ],
          ),
        ),
        Container(
          height: 165,
          width: 23,
          color: colorMain,
          child: Center(
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                title,
                style: TextAppStyle().styleBold15White(),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              SizedBox(height: 9, width: 16),
              Container(
                height: 9,
                width: 7,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
                    color: ColorCommon.colorBoxWin),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
