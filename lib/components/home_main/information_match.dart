import 'package:base_flutter_framework/screens/location/location_screen.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:flutter/material.dart';

import 'icon_before_data.dart';

Widget informationMatch(
    {required String location,
    required String time,
    required double money,
    required BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            NavigatorCommon.navigatorLeftToRightAsyn(
                context: context, goto: LocationScreen());
          },
          child: iconBeforeData(
            icon: Image.asset(
              StringCommon.pathIconLocation,
              color: ColorCommon.colorIconBlue,
            ),
            data: location,
          ),
        ),
        iconBeforeData(
          icon: Image.asset(
            StringCommon.pathIconTime,
            color: ColorCommon.colorIconBlue,
          ),
          data: time,
        ),
        iconBeforeData(
          icon: Image.asset(
            StringCommon.pathIconMoney,
            color: ColorCommon.colorIconBlue,
          ),
          data: money.toString(),
        ),
      ],
    ),
  );
}
