import 'package:base_flutter_framework/components/dialog/btnOk_cancel.dart';
import 'package:base_flutter_framework/components/widget/custom_radio_widget.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import '../list_tile.dart';

class DialogLeg extends StatefulWidget {
  DialogLeg({Key? key}) : super(key: key);

  @override
  _DialogLegState createState() => _DialogLegState();
}

class _DialogLegState extends State<DialogLeg> {
  bool moreDisplay = false;
  String groupValue = "nam";

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
        StringCommon.leg,
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
          height: 400,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: ContainerAppStyle().containerRadius(Colors.white),
          child: Column(
            children: [
              header(),
              Container(
                height: 240,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    listTile(
                        listTile: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                      dense: true,
                      title: Text(
                        "Left",
                        style: TextAppStyle().styleVeryBold15Blue(),
                      ),
                      trailing: CustomRadioWidget<String>(
                        value: "nam",
                        groupValue: groupValue,
                        onChanged: (String value) {
                          setState(() {
                            groupValue = "nam";
                          });
                        },
                      ),
                    )),
                    listTile(
                        listTile: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                      dense: true,
                      title: Text(
                        "Right",
                        style: TextAppStyle().styleVeryBold15Blue(),
                      ),
                      trailing: CustomRadioWidget<String>(
                        value: "nu",
                        groupValue: groupValue,
                        onChanged: (String value) {
                          setState(() {
                            groupValue = "nu";
                          });
                        },
                      ),
                    )),
                    listTile(
                        listTile: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                      dense: true,
                      title: Text(
                        "Left & Right",
                        style: TextAppStyle().styleVeryBold15Blue(),
                      ),
                      trailing: CustomRadioWidget<String>(
                        value: "khac",
                        groupValue: groupValue,
                        onChanged: (String value) {
                          setState(() {
                            groupValue = "khac";
                          });
                        },
                      ),
                    )),
                    listTile(
                      listTile: ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonOkCancel(onclickOk: () {
                NavigatorCommon.popNavigator(context: context);
              }, onclickCancel: () {
                NavigatorCommon.popNavigator(context: context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
