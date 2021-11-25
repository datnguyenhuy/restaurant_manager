import 'package:base_flutter_framework/components/widget/button_no_icon.dart';
import 'package:base_flutter_framework/components/widget/circle_icon.dart';
import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/search_box.dart';
import 'package:base_flutter_framework/components/widget/sliding_panel_up.dart';
import 'package:base_flutter_framework/components/widget/toobar.dart';
import 'package:base_flutter_framework/core/models/invitations.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/resource/resource_const.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'search_location.childrent.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
        paddingBool: true,
        backgroundColor: ColorCommon.bgMain,
        context: context,
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  widget._toolBar(context),
                  widget._searchBar(searchController),
                  widget.listSearchLocation()
                ],
              ),
              SlidingPanelUp(
                  autoEnableScrollController: false,
                  child: (controller) {
                    return widget.listInvitations(controller, context);
                  },
                  title: StringCommon.invitations),
            ],
          ),
        ));
  }
}
