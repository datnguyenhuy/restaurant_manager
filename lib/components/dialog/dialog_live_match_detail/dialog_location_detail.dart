import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_color_picker.dart';
import 'package:base_flutter_framework/components/final_match/item_list_final_match.dart';
import 'package:base_flutter_framework/components/final_match/line_item.dart';
import 'package:base_flutter_framework/components/widget/circle_icon.dart';
import 'package:base_flutter_framework/components/widget/custom_radio_widget.dart';
import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/resource/resource_const.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/button_style.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogLocationDetail extends StatefulWidget {
  bool checkChangePick;

  DialogLocationDetail({Key? key, required this.checkChangePick})
      : super(key: key);

  @override
  _DialogLocationDetailState createState() => _DialogLocationDetailState();
}

class _DialogLocationDetailState extends State<DialogLocationDetail> {
  String groupValue = "ball";

  Widget header() {
    return Container(
      width: double.infinity,
      height: 57,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorCommon.colorRed,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Text(
        StringCommon.locationDetail,
        style: TextAppStyle().styleVeryBold20White(),
      ),
    );
  }

  Widget buttonAccept() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextButton(
          onPressed: () {
            NavigatorCommon.popNavigator(context: context);
          },
          style: ButtonAppStyle().buttonWrap(),
          child: imageFromLocale(
              url: ResourceApp().iconAccept, width: 40, height: 40)),
    );
  }

  Widget changePick() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          NavigatorCommon.popNavigator(context: context);
          NavigatorCommon.showDialogCommon(
              context: context, child: DialogColorPicker());
        },
        style: ButtonAppStyle().buttonWrap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(StringCommon.pathIconChangePick),
            SizedBox(
              width: 10,
            ),
            Text(
              "Change Pick",
              style: TextAppStyle().styleNormal15Blue(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomRadioWidget<String>(
                value: "ball",
                groupValue: groupValue,
                onChanged: (String value) {
                  setState(() {
                    groupValue = "ball";
                  });
                },
              ),
              Text(
                "Ball",
                style: TextAppStyle().styleNormal15Blue(),
              ),
            ],
          ),
          Row(
            children: [
              CustomRadioWidget<String>(
                value: "drink",
                groupValue: groupValue,
                onChanged: (String value) {
                  setState(() {
                    groupValue = "drink";
                  });
                },
              ),
              Text(
                "Drink",
                style: TextAppStyle().styleNormal15Blue(),
              ),
            ],
          ),
          Row(
            children: [
              CustomRadioWidget<String>(
                value: "shirt",
                groupValue: groupValue,
                onChanged: (String value) {
                  setState(() {
                    groupValue = "shirt";
                  });
                },
              ),
              Text(
                "Shirt",
                style: TextAppStyle().styleNormal15Blue(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemListFinalMatch() {
    return Container(
      height: 143,
      width: 294,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ContainerAppStyle().decorationItemListFinalMatch(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 294,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lineItem(
                      pathIcon: StringCommon.pathIconStadium, data: "Nou Camp"),
                  lineItem(
                      pathIcon: StringCommon.pathIconCall,
                      color: ColorCommon.colorIconBlue,
                      data: "0962461322"),
                  lineItem(
                      pathIcon: StringCommon.pathIconMap,
                      color: ColorCommon.colorIconBlue,
                      data: "Viet Nam"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lineItem(
                          pathIcon: StringCommon.pathIconLike,
                          color: ColorCommon.colorIconBlue,
                          data: "Rate"),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RatingBarIndicator(
                          rating: 2.75,
                          unratedColor: ColorCommon.unratedColor,
                          itemPadding: const EdgeInsets.only(right: 10),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: ColorCommon.colorIconRed,
                          ),
                          itemCount: 5,
                          itemSize: 24.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(StringCommon.pathImageBallLeft),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(StringCommon.pathImageBallRight),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 400,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: ContainerAppStyle().containerRadius(Colors.white),
          child: Column(
            children: [
              header(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                child: _itemListFinalMatch(),
              ),
              _radioBox(),
              widget.checkChangePick == true ? changePick() : buttonAccept()
            ],
          ),
        ),
      ),
    );
  }
}
