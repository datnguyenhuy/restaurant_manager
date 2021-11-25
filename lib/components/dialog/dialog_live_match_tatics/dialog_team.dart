import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import '../diagram_team.dart';

class DialogTeam extends StatefulWidget {
  const DialogTeam({Key? key}) : super(key: key);

  @override
  _DialogTeamState createState() => _DialogTeamState();
}

class _DialogTeamState extends State<DialogTeam> {
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
        "Team",
        style: TextAppStyle().styleVeryBold20White(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 420,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: ContainerAppStyle().containerRadius(Colors.white),
          child: Column(
            children: [
              header(),
              diagram(
                  numberOne: 3,
                  numberTwo: 2,
                  numberThree: 1,
                  numberFour: 1,
                  onClick: () {
                    NavigatorCommon.popNavigator(context: context);
                  }),
              diagram(
                  numberOne: 3,
                  numberTwo: 2,
                  numberThree: 1,
                  numberFour: 1,
                  onClick: () {
                    NavigatorCommon.popNavigator(context: context);
                  }),
              diagram(
                  numberOne: 3,
                  numberTwo: 2,
                  numberThree: 1,
                  numberFour: 1,
                  onClick: () {
                    NavigatorCommon.popNavigator(context: context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
