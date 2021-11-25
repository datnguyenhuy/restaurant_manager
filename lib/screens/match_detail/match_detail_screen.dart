import 'package:base_flutter_framework/components/home_main/header.dart';
import 'package:base_flutter_framework/components/home_main/information_match.dart';
import 'package:base_flutter_framework/components/home_main/item_list_history_match.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/tool_bar_common.dart';
import 'package:base_flutter_framework/core/models/live_match_model.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

part 'match_detail_children.dart';

class MatchDetailScreen extends StatefulWidget {
  LiveMatchModel liveMatch;

  MatchDetailScreen({required this.liveMatch});

  @override
  State<StatefulWidget> createState() {
    return MatchDetailScreenState();
  }
}

class MatchDetailScreenState extends State<MatchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        context: context,
        backgroundColor: ColorCommon.colorBackground,
        paddingBool: true,
        child: Container(
          child: Column(
            children: [
              toolBar(
                  onClickBack: () {
                    NavigatorCommon.popNavigator(context: context);
                  },
                  title: "Match Detail"),
              widget.informationBox(context),
              widget._rowBoxNumber(context),
              Expanded(child: widget.listMember())
            ],
          ),
        ));
  }
}
