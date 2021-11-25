import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:flutter/material.dart';

class TextAppStyle {
  TextStyle textTitleBottomSheetStyle() {
    return TextStyle(
        fontWeight: FontWeight.w900,
        color: ColorCommon.colorRed,
        fontSize: DimensCommon.fontSizeSmallBig);
  }

  TextStyle textStyleName() {
    return TextStyle(
        fontWeight: FontWeight.w900,
        color: ColorCommon.colorName,
        fontSize: DimensCommon.fontSizeMedium);
  }

  TextStyle textStyleNormal() {
    return TextStyle(
        color: ColorCommon.colorName, fontSize: DimensCommon.fontSizeMedium);
  }

  TextStyle textStyleInfo() {
    return TextStyle(
        color: ColorCommon.colorItem, fontSize: DimensCommon.fontSizeMedium);
  }

  TextStyle textStyleAppBar() {
    return TextStyle(
        fontWeight: FontWeight.w900,
        color: ColorCommon.colorName,
        fontSize: DimensCommon.fontSizeSmallBig);
  }

  TextStyle textStyleItemSearch() {
    return TextStyle(
        color: ColorCommon.colorName, fontSize: DimensCommon.fontSizeBig);
  }

  TextStyle styleNormal10White() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeMaxSmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleNormal12Black() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeVerySmall,
      color: ColorCommon.colorBlack,
    );
  }

  TextStyle styleNormal12White() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeVerySmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleNormal15Red() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorIconRed,
    );
  }

  TextStyle styleNormal15Blue() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorIconBlue,
    );
  }

  TextStyle styleNormal15Black() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorBlack,
    );
  }

  TextStyle styleNormal18Blue() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: DimensCommon.fontSizeMedium,
      color: ColorCommon.colorNumber,
    );
  }

  TextStyle styleBold12White() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeVerySmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleBold15White() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleBold15Blue() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorIconBlue,
    );
  }

  TextStyle styleBold20Blue() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeSmallBig,
      color: ColorCommon.colorIconBlue,
    );
  }

  TextStyle styleBold25White() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeVeryBig,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleBold30White() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: DimensCommon.fontSizeMaxBig,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleVeryBold10White() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeMaxSmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleVeryBold12Red() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeVerySmall,
      color: ColorCommon.colorIconRed,
    );
  }

  TextStyle styleVeryBold15Red() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorIconRed,
    );
  }

  TextStyle styleVeryBold15Blue() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorIconBlue,
    );
  }

  TextStyle styleVeryBold15White() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: ColorCommon.colorWhite,
    );
  }

  TextStyle styleVeryBold15Black() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeMediumSmall,
      color: Colors.black,
    );
  }

  TextStyle styleVeryBold18Black() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeBig,
      color: Colors.black,
    );
  }

  TextStyle styleVeryBold20White() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: DimensCommon.fontSizeBig,
      color: ColorCommon.colorWhite,
    );
  }
}
