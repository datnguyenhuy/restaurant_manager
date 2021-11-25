import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:flutter/material.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  CustomRadioWidget(
      {required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.groupValue);
        },
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              border: Border.all(color: ColorCommon.colorIconRed, width: 1),
              shape: BoxShape.circle),
          child: Center(
            child: Container(
              height: 20 - 8,
              width: 20 - 8,
              margin: EdgeInsets.all(3),
              child: Image.asset(
                StringCommon.pathIconCheck,
                color: groupValue == value
                    ? ColorCommon.colorIconRed
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
