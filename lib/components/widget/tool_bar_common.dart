import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:flutter/material.dart';

Widget toolBar({
  required void Function()? onClickBack,
  required String title,
  Widget? tailing,
}) {
  return Container(
    decoration: ContainerAppStyle().decorationToolbar(),
    child: Row(
      children: [
        Expanded(
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
              onPressed: onClickBack),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: ColorCommon.colorNumber),
            ),
          ),
          flex: 5,
        ),
        tailing != null
            ? Expanded(child: tailing)
            : Expanded(child: SizedBox.shrink()),
      ],
    ),
  );
}
