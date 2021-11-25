import 'package:flutter/material.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerAppStyle {
  BoxDecoration containerRadius(Color color) {
    return BoxDecoration(borderRadius: BorderRadius.circular(10), color: color);
  }

  BoxDecoration decorationItemList() {
    return BoxDecoration(
      color: ColorCommon.colorItemList,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.1),
          blurRadius: 5,
          offset: Offset(0, 1),
        )
      ],
    );
  }

  BoxDecoration decorationItemListAddress() {
    return BoxDecoration(
      color: ColorCommon.colorItemList,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.15),
          blurRadius: 4,
        )
      ],
    );
  }

  BoxDecoration decorationItemListFinalMatch() {
    return BoxDecoration(
      color: ColorCommon.colorItemList,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.25),
          blurRadius: 4,
        )
      ],
    );
  }

  BoxDecoration decorationSearchBox() {
    return BoxDecoration(
      color: ColorCommon.colorItemList,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.25),
          blurRadius: 4,
          offset: Offset(0, 1),
        )
      ],
    );
  }

  BoxDecoration decorationAttende() {
    return BoxDecoration(
      color: ColorCommon.colorBackground,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.1),
          blurRadius: 4,
        )
      ],
    );
  }

  BoxDecoration decorationToolbar() {
    return BoxDecoration(
      color: ColorCommon.colorToolBar,
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],
    );
  }

  BoxDecoration decorationBoxSub() {
    return BoxDecoration(
        color: ColorCommon.colorNumber,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(width: 1, color: ColorCommon.colorWhite));
  }

  BoxDecoration decorationItemListDetailMatch() {
    return BoxDecoration(
      color: ColorCommon.colorItemList,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3)),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.1),
          blurRadius: 5,
          offset: Offset(0, 2),
        )
      ],
    );
  }

  BoxDecoration decorationItemListDetailMatchOutline() {
    return BoxDecoration(
      color: Colors.grey[500],
      borderRadius: BorderRadius.only(
        bottomLeft: const Radius.circular(5.0),
        bottomRight: const Radius.circular(5.0),
      ),
      // border:
      //     Border(bottom: BorderSide(width: 1, color: ColorCommon.colorBlack)),
      boxShadow: [
        BoxShadow(
          color: ColorCommon.colorBlack.withOpacity(0.1),
          blurRadius: 5,
          offset: Offset(0, 2),
        )
      ],
    );
  }

  BoxDecoration decorationItemListDetailMatchInline() {
    return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.only(
        bottomLeft: const Radius.circular(3.0),
        bottomRight: const Radius.circular(3.0),
      ),
    );
  }

  BoxDecoration decorationBoxWin() {
    return BoxDecoration(
      color: ColorCommon.colorBoxWin,
      borderRadius: BorderRadius.circular(3),
    );
  }
}
