import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_location_detail.dart';
import 'package:base_flutter_framework/components/final_match/item_list_final_match.dart';
import 'package:base_flutter_framework/components/home_main/item_list_live_match.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/components/widget/custom_radio_widget.dart';
import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/toobar.dart';
import 'package:base_flutter_framework/components/widget/tool_bar_common.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

part 'location_children.dart';

enum Type { match, map }

class LocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocationScreenState();
  }
}

class LocationScreenState extends State<LocationScreen> {
  Type type = Type.match;

  Widget radioBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomRadioWidget<Type>(
              value: Type.match,
              groupValue: type,
              onChanged: (Type value) {
                setState(() {
                  type = Type.match;
                });
              },
            ),
            Text(
              "Final match field",
              style: TextAppStyle().styleNormal18Blue(),
            ),
          ],
        ),
        Row(
          children: [
            CustomRadioWidget<Type>(
              value: Type.map,
              groupValue: type,
              onChanged: (Type value) {
                setState(() {
                  type = Type.map;
                });
              },
            ),
            Text(
              "Map",
              style: TextAppStyle().styleNormal18Blue(),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        context: context,
        backgroundColor: ColorCommon.colorBackground,
        child: Container(
          child: Column(
            children: [
              toolBar(onClickBack: () {}, title: "Location"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    widget._searchBox(),
                    radioBox(),
                  ],
                ),
              ),
              type == Type.map
                  ? Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: widget._listAddress()))
                  : Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          child: widget._listFinalMatch(context)))
            ],
          ),
        ));
  }
}
