import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/style/button_style.dart';
import 'package:flutter/material.dart';

class CircleAddButton extends StatefulWidget {
  final Function() onclick;
  final double height;
  const CircleAddButton({Key? key, required this.onclick, this.height = 60})
      : super(key: key);

  @override
  _CircleAddButtonState createState() => _CircleAddButtonState();
}

class _CircleAddButtonState extends State<CircleAddButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onclick();
      },
      style: ButtonAppStyle().buttonWrap(),
      child: Container(
        height: widget.height,
        width: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor("#40618F"),
                  HexColor("#DE4A39"),
                ]),
            shape: BoxShape.circle),
        child: Icon(
          Icons.add,
          size: widget.height - 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
