import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

Widget lineItem({required String pathIcon, required String data, Color? color}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 29),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(pathIcon, color: color,),
          ),
          Container(
            child: Text(
              data,
              style: TextAppStyle().styleNormal15Blue(),
            ),
          )
        ],
      ),
    );
  }