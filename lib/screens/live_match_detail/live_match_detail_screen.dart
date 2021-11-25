import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/sliding_panel_up.dart';
import 'package:base_flutter_framework/components/widget/toobar.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/resource/resource_const.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/button_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import 'chat_ui_test.dart';

part 'live_match_detail.children.dart';

class LiveMatchDetailScreen extends StatefulWidget {
  const LiveMatchDetailScreen({Key? key}) : super(key: key);

  @override
  _LiveMatchDetailScreenState createState() => _LiveMatchDetailScreenState();
}

class _LiveMatchDetailScreenState extends State<LiveMatchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        paddingBool: true,
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        context: context,
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  widget._toolBar(),
                  // Expanded(

                  //   child: widget.tabBar(),
                  // )
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
