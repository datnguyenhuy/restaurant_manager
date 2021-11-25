import 'package:base_flutter_framework/components/widget/circle_icon.dart';
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

class DialogFillMe extends StatefulWidget {
  const DialogFillMe({Key? key}) : super(key: key);

  @override
  _DialogFillMeState createState() => _DialogFillMeState();
}

class _DialogFillMeState extends State<DialogFillMe> {
  int indexSelect = 0;
  int indexAccept = 0;
  bool accept = true;

  Widget result() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
      decoration: ContainerAppStyle().containerRadius(Colors.white),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              StringCommon.result,
              style: TextAppStyle().styleVeryBold18Black(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                item(
                    title: "W",
                    colorSelect: HexColor("40618F"),
                    select: indexSelect == 0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    onclick: () {
                      setState(() {
                        indexSelect = 0;
                      });
                    }),
                item(
                    title: "L",
                    colorSelect: HexColor("40618F"),
                    select: indexSelect == 1,
                    onclick: () {
                      setState(() {
                        indexSelect = 1;
                      });
                    }),
                item(
                    title: "D",
                    colorSelect: HexColor("DE4A39"),
                    select: indexSelect == 2,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    onclick: () {
                      setState(() {
                        indexSelect = 2;
                      });
                    }),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              StringCommon.doYouScore,
              style: TextAppStyle().styleVeryBold18Black(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                item(
                    title: "Yes",
                    colorSelect: HexColor("40618F"),
                    select: indexAccept == 0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    onclick: () {
                      setState(() {
                        indexAccept = 0;
                      });
                    }),
                item(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    title: "No",
                    colorSelect: HexColor("40618F"),
                    select: indexAccept == 1,
                    onclick: () {
                      setState(() {
                        indexAccept = 1;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required String title,
    required Color colorSelect,
    required bool select,
    required Function() onclick,
    BorderRadius? borderRadius,
  }) {
    return GestureDetector(
      onTap: () {
        onclick();
      },
      child: Container(
        width: 65,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: select ? colorSelect : HexColor("DADADA"),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextAppStyle().styleVeryBold20White(),
        ),
      ),
    );
  }

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
        StringCommon.fillMe,
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
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: circleAvatar(
                    radius: 80,
                    child: imageFromNetWork(
                        url:
                            "https://vnn-imgs-a1.vgcloud.vn/sohanews.sohacdn.com/2019/10/15/duong-yen-nhung-4-15711576968201464902133.jpg",
                        width: 80,
                        height: 80)),
              ),
              result(),
              buttonAccept()
            ],
          ),
        ),
      ),
    );
  }
}
