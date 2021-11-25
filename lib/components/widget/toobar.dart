import 'dart:io';

import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:flutter/material.dart';

Widget toolBarCommon(
    {required BuildContext context,
    required Color background,
  
    required Widget child,
    required Function onclickIcon}) {
  IconData icon = Icons.arrow_back_ios;
  // if (Platform.isAndroid) {
  //   icon = Icons.arrow_back;
  // }
  return Card(
    elevation: 1,
    
    child: Container(
      height: 70,
   
      child: Container(
        color: background,
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: DimensCommon.sizeWidth(context: context),
                child: child,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  width: DimensCommon.sizeBackButton,
                  child: IconButton(
                    splashColor: Colors.black,
                    icon: Icon(
                      icon,
                      color: HexColor("032F58"),
                      size: DimensCommon.fontSizeIconBig,
                    ),
                    onPressed: () {
                      onclickIcon();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
