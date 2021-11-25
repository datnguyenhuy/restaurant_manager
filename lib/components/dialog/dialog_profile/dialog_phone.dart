import 'package:base_flutter_framework/components/dialog/btnOk_cancel.dart';
import 'package:base_flutter_framework/components/widget/custom_radio_widget.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/container_style.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import '../list_tile.dart';

class DialogPhoneNumber extends StatefulWidget {
  DialogPhoneNumber({Key? key}) : super(key: key);

  @override
  _DialogPhoneNumberState createState() => _DialogPhoneNumberState();
}

class _DialogPhoneNumberState extends State<DialogPhoneNumber> {
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
        StringCommon.phoneNumber,
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
          height: 290,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: ContainerAppStyle().containerRadius(Colors.white),
          child: Column(
            children: [
              header(),
              Container(
                height: 130,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    listTile(
                        listTile: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                      dense: true,
                      title: Text(
                        "0123456789",
                        style: TextAppStyle().styleVeryBold15Blue(),
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
