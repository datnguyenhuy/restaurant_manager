import 'package:base_flutter_framework/components/final_match/item_list_final_match.dart';
import 'package:base_flutter_framework/components/final_match/line_item.dart';
import 'package:base_flutter_framework/components/widget/circle_icon.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogAttende extends StatefulWidget {
  DialogAttende({Key? key}) : super(key: key);

  @override
  _DialogAttendeState createState() => _DialogAttendeState();
}

class _DialogAttendeState extends State<DialogAttende> {
  bool sel1 = false;
  bool sel2 = false;
  bool sel3 = false;
  bool sel4 = false;

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
        StringCommon.attende,
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

  Widget listPlayer() {
    return Container(
      height: 333,
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 28),
      decoration: ContainerAppStyle().decorationAttende(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Player",
                style: TextAppStyle().styleBold20Blue(),
              ),
              Text(
                "Present",
                style: TextAppStyle().styleBold20Blue(),
              ),
            ],
          ),
          itemListPlayer(sel1),
          itemListPlayer(sel2),
          itemListPlayer(sel3),
          itemListPlayer(sel4),
        ],
      ),
    );
  }

  Widget itemListPlayer(bool select) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          circleWidgetBordered(
            child: Image.asset("assets/icons/avatar.png"),
            maxRadius: 23.5,
            widthBorder: 2,
            colorBorder: ColorCommon.colorIconRed,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(StringCommon.pathIconLine),
          ),
          CustomRadioWidget<bool>(
            value: select,
            groupValue: select,
            onChanged: (bool value) {
              setState(() {
                select = !select;
              });
            },
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
          height: 525,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: ContainerAppStyle().containerRadius(Colors.white),
          child: Column(
            children: [header(), listPlayer(), buttonAccept()],
          ),
        ),
      ),
    );
  }
}
