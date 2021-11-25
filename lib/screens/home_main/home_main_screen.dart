import 'dart:async';

import 'package:base_flutter_framework/components/widget/button_no_icon.dart';
import 'package:base_flutter_framework/components/widget/circle_add_button.dart';
import 'package:base_flutter_framework/components/widget/circle_icon.dart';
import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/sliding_panel_up.dart';
import 'package:base_flutter_framework/core/models/invitations.dart';
import 'package:base_flutter_framework/repository/home_repository.dart';
import 'package:base_flutter_framework/repository/match_repository.dart';
import 'package:base_flutter_framework/screens/final_match.dart/final_match_screen.dart';
import 'package:base_flutter_framework/screens/live_match_detail/live_match_detail_page.dart';
import 'package:base_flutter_framework/screens/match_detail/match_detail_screen.dart';
import 'package:base_flutter_framework/screens/profile/profile_screen.dart';
import 'package:base_flutter_framework/screens/search_location/search_location_page.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/resource/resource_const.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/components/home_main/item_list_history_match.dart';
import 'package:base_flutter_framework/components/home_main/item_list_live_match.dart';
import 'package:base_flutter_framework/components/widget/circle_widget_bordered.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/core/models/live_match_model.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/button_style.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
part 'home_main.children.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        paddingBool: true,
        backgroundColor: ColorCommon.colorBackground,
        context: context,
        child: Container(
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      widget.header(context),
                      Expanded(
                        child: widget.tabBar(),
                      )
                    ],
                  ),
                  widget.itemLiveMatchNow(),
                ],
              ),
              SlidingPanelUp(
                  autoEnableScrollController: true,
                  child: (controller) {
                    return widget.listInvitations(controller, context);
                  },
                  title: StringCommon.invitations),
            ],
          ),
        ),
        floatButton: CircleAddButton(
          height: 60,
          onclick: () {},
        ));
  }
}
