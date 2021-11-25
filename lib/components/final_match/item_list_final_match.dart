import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_location_detail.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'line_item.dart';

Widget itemListFinalMatch() {
  return Container(
    height: 193,
    width: 393,
    margin: const EdgeInsets.only(bottom: 10),
    decoration: ContainerAppStyle().decorationItemListFinalMatch(),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 393,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Text(
                      "Football field menu",
                      style: TextAppStyle().styleVeryBold15Red(),
                    ),
                  ),
                ),
                lineItem(
                    pathIcon: StringCommon.pathIconCall, data: "0962461322"),
                lineItem(
                    pathIcon: StringCommon.pathIconMap, data: "Viet Nam"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lineItem(
                        pathIcon: StringCommon.pathIconLike, data: "Rate"),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: RatingBarIndicator(
                        rating: 2.75,
                        unratedColor: ColorCommon.unratedColor,
                        itemPadding: const EdgeInsets.only(right: 11),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: ColorCommon.colorIconRed,
                        ),
                        itemCount: 5,
                        itemSize: 24.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(StringCommon.pathImageBallLeft),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(StringCommon.pathImageBallRight),
        ),
      ],
    ),
  );
}
