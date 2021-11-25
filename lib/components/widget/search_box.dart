import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'circle_icon.dart';

Widget searchBox(
    {required String hintText,
    required Function? searchComfirm(String text),
    required Widget icon ,
    required TextEditingController controller}) {
  return Container(
    height: 60,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
         boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ],
        borderRadius: BorderRadius.all(Radius.circular(10))),
   
    child: Row(
      children: [
        icon,
        Expanded(
          child: Container(
             margin: EdgeInsets.only(bottom: 5),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              style:
                  TextStyle(fontSize: DimensCommon.fontSizeSmall, color: Colors.black),
              controller: controller,
              onFieldSubmitted: (value) {
                searchComfirm(value);
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  filled: true,
             
             
                  hintText: hintText,
                  border: InputBorder.none,
                    fillColor: Colors.white,
                  hintStyle: TextStyle(
                      fontSize: DimensCommon.fontSizeMedium,
                      color: ColorCommon.colorHintText)),
            ),
          ),
        ),
        Container(
            height: 60, 
            width: 60,
            child: CircleAvatar(backgroundColor: ColorCommon.colorName,child: Icon(Icons.search, color: Colors.white,size: 30,),))
      ],
    ),
  );
}
