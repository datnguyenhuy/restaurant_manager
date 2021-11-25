import 'dart:async';

import 'package:base_flutter_framework/components/dialog/diagram_team.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_attende.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_fill_me.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_tatics/dialog_team.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:base_flutter_framework/components/home_main/header.dart';
import 'package:base_flutter_framework/components/home_main/information_match.dart';
import 'package:base_flutter_framework/components/home_main/item_list_live_match.dart';
import 'package:base_flutter_framework/components/widget/circle_icon.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/sliding_panel_up.dart';
import 'package:base_flutter_framework/components/widget/toobar.dart';
import 'package:base_flutter_framework/components/widget/tool_bar_common.dart';
import 'package:base_flutter_framework/screens/live_match_detail/chat_ui_test.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

part 'final_match_children.dart';

class FinalMatchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalMatchScreenState();
  }
}

class FinalMatchScreenState extends State<FinalMatchScreen> {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () {
    //   NavigatorCommon.showDialogCommon(context: context, child: DialogFillMe());
    // });
    return scaffoldPadding(
        context: context,
        backgroundColor: ColorCommon.colorBackground,
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  toolBar(
                      onClickBack: () {
                        NavigatorCommon.popNavigator(context: context);
                      },
                      title: "Final Match",
                      tailing: Image.asset(StringCommon.pathIconForward)),
                  Expanded(child: widget._tabBar(context))
                ],
              ),
              SlidingPanelUp(
                  autoEnableScrollController: false,
                  child: (controller) {
                    return Container(
                      height: DimensCommon.sizeHeight(context: context) - 100,
                      child: Scaffold(
                          resizeToAvoidBottomInset: true,
                          body: ChatPage(
                            scrollController: controller,
                          )),
                    );
                  },
                  title: StringCommon.invitations),
            ],
          ),
        ));
  }
}
