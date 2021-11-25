import 'package:flutter/material.dart';

Widget circleWidgetBordered({
  required Widget child,
  void Function()? onTap,
  double? maxRadius,
  double? widthBorder,
  Color? colorBorder,
  Color? background
}) {
  return Container(
    child: GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: maxRadius,
        backgroundColor: colorBorder,
        child: Container(
          padding: EdgeInsets.all(widthBorder ?? 0),
          child: CircleAvatar(
            child: child,
            maxRadius: (maxRadius ?? 30 - (widthBorder ?? 0)),
            backgroundColor: background,
          ),
        ),
      ),
    ),
  );
}
