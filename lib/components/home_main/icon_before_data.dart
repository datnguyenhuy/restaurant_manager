import 'package:base_flutter_framework/utils/color.dart';
import 'package:flutter/material.dart';

Widget iconBeforeData({
  required Widget icon,
  required String data,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        icon,
        Expanded(
          child: Center(
            child: Text(
              data,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: ColorCommon.colorText,),
            ),
          ),
        ),
      ],
    ),
  );
}
