import 'package:base_flutter_framework/utils/color.dart';
import 'package:flutter/material.dart';

Widget listTile({required Widget listTile}) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ColorCommon.colorBlack.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 4)
        ],
      ),
      child: listTile,
    );
  }