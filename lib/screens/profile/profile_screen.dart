import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_fill_me.dart';
import 'package:base_flutter_framework/components/dialog/dialog_profile/dialog_gender.dart';
import 'package:base_flutter_framework/components/dialog/dialog_profile/dialog_height.dart';
import 'package:base_flutter_framework/components/dialog/dialog_profile/dialog_leg.dart';
import 'package:base_flutter_framework/components/dialog/dialog_profile/dialog_phone.dart';
import 'package:base_flutter_framework/components/widget/button_no_icon.dart';
import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/tool_bar_common.dart';
import 'package:base_flutter_framework/core/models/player_statistic.dart';
import 'package:base_flutter_framework/core/models/profile.dart';
import 'package:base_flutter_framework/screens/favorite_position/favorite_position_page.dart';
import 'package:base_flutter_framework/services/socket_io.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
part 'profile_children.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

enum BestTutorSite {
  cafedev,
  w3schools,
  tutorialandexample,
  dayvah,
  hsgav,
  heaucejav
}

class ProfileScreenState extends State<ProfileScreen> {
  BestTutorSite _site = BestTutorSite.cafedev;

  bool moreDisplay = false;
  bool showGender = false;

  Widget dialog({required String title, required List<String> listOption}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 40,
          color: ColorCommon.colorBlack.withOpacity(0.5),
        ),
        Container(
          height: 55.0 * listOption.length + 210,
          margin: EdgeInsets.only(right: 30, left: 30, top: 180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorCommon.colorBackground,
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: ColorCommon.colorIconRed),
                child: Center(
                  child: Text(
                    title,
                    style: TextAppStyle().styleVeryBold15White(),
                  ),
                ),
              ),
              Container(
                height: 55.0 * listOption.length + 20,
                padding: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: listOption.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: widget._boxShadow()),
                      child: ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        dense: true,
                        title: Text(
                          listOption[index],
                          style: TextAppStyle().styleVeryBold15Blue(),
                        ),
                        trailing: Radio(
                          value: BestTutorSite.values.elementAt(index),
                          groupValue: _site,
                          activeColor: ColorCommon.colorIconRed,
                          onChanged: (BestTutorSite? value) {
                            setState(() {
                              _site = value!;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 45,
                margin:
                    EdgeInsets.only(top: 5, bottom: 25, right: 20, left: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: widget._boxShadow()),
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  dense: true,
                  title: Text(
                    "Display for others",
                    style: TextAppStyle().styleVeryBold15Blue(),
                  ),
                  trailing: Switch(
                    value: moreDisplay,
                    activeColor: ColorCommon.colorIconRed,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        moreDisplay = value;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: buttonNoIcon(
                          title: "OK",
                          colorBackground: ColorCommon.colorIconBlue,
                          textColor: ColorCommon.colorWhite,
                          onclick: () {
                            NavigatorCommon.popNavigator(context: context);
                          },
                          padding: EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: buttonNoIcon(
                        title: "Cancel",
                        colorBackground: ColorCommon.colorIconRed,
                        textColor: ColorCommon.colorWhite,
                        onclick: () {
                          NavigatorCommon.popNavigator(context: context);
                        },
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget listOption({required BuildContext context, required Profile profile}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          widget._option(
              pathIcon: StringCommon.pathIconAccount,
              title: "Name",
              onPressed: () {}),
          widget._option(
              pathIcon: StringCommon.pathIconMale,
              title: "Gender",
              onPressed: () {
                NavigatorCommon.showDialogCommon(
                    context: context, child: DialogGender());
              }),
          widget._option(
              pathIcon: StringCommon.pathIconLeg,
              title: "Leg",
              onPressed: () {
                NavigatorCommon.showDialogCommon(
                    context: context, child: DialogLeg());
              }),
          widget._option(
              pathIcon: StringCommon.pathIconPhone,
              title: "Phone Number",
              onPressed: () {
                NavigatorCommon.showDialogCommon(
                    context: context, child: DialogPhoneNumber());
              }),
          widget._option(
              pathIcon: StringCommon.pathIconWeightHeight,
              title: "Weight/Height",
              onPressed: () {
                NavigatorCommon.showDialogCommon(
                    context: context, child: DialogHeightWeight());
              }),
          widget._option(
              pathIcon: StringCommon.pathIconFavorite,
              title: "Favorite position",
              onPressed: () {
                NavigatorCommon.navigatorLeftToRight(
                    context: context, goto: FavoritePositionPage());
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldPadding(
      context: context,
      paddingBool: true,
      backgroundColor: ColorCommon.colorBackground,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                toolBar(
                    onClickBack: () {
                      NavigatorCommon.popNavigator(context: context);
                    },
                    title: "Profile",
                    tailing: IconButton(
                        onPressed: () {},
                        icon: Image.asset(StringCommon.pathIconForward))),
                widget.content(
                  playerStatistic: PlayerStatistic(
                    name: "Messi",
                    avatar: StringCommon.pathImageMessi,
                    win: 9,
                    low: 5,
                    draw: 6,
                    matchComplete: 20,
                    height: 169,
                    weight: 150,
                    strongLeg: "Left",
                    BMI: 22,
                    age: 37,
                    location: "striker",
                    indexLB: 2,
                    percentLB: 50,
                    indexRB: 3,
                    percentRB: 40,
                    indexCB: 7,
                    percentCB: 80,
                  ),
                ),
                listOption(
                  context: context,
                  profile: Profile(
                    nameAccount: "Dat Nguyen Huy",
                    gender: "Male",
                    leg: "Right",
                    phone: "0962461322",
                    weight: 62,
                    height: 176,
                    listFavorite: [],
                  ),
                )
              ],
            ),
            Container(
              child: Visibility(
                  visible: showGender,
                  child: dialog(
                      title: "Gender",
                      listOption: ["Nam", "Nữ", "Khác", "Female", "Male"])),
            ),
          ],
        ),
      ),
    );
  }
}
