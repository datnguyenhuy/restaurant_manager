import 'package:base_flutter_framework/components/widget/scaffold_padding.dart';
import 'package:base_flutter_framework/components/widget/tool_bar_common.dart';
import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/navigator.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class FavoritePositionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoritePositionScreenState();
  }
}

enum checkBox{a,b,c,d,e,f,g,h,i,j,k,l,m,o,p,q}

class FavoritePositionScreenState extends State<FavoritePositionScreen> {
  bool check = false;

  Widget listOption({required List<String> listOption}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listOption.length,
        itemBuilder: (context, index) {
          return Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              
            ),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              dense: true,
              title: Text(
                listOption[index],
                style: TextAppStyle().styleVeryBold15Blue(),
              ),
              trailing: Checkbox(
                value: check,
                onChanged: (bool? value) {
                  setState(() {
                    check = !check;
                  });
                },
                //checkColor: ColorCommon.colorIconRed,
                activeColor: ColorCommon.colorIconRed,
                shape: CircleBorder(),
              ),
            ),
          );
        },
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
          height: MediaQuery.of(context).size.height - 40,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              toolBar(onClickBack: () {
                NavigatorCommon.popNavigator(context: context);
              }, title: "Favorite Position"),
              Expanded(
                child: listOption(listOption: [
                  "GK",
                  "LB",
                  "CB",
                  "RB",
                  "DMF",
                  "CMF",
                  "LMF",
                  "AMF",
                  "SS",
                  "CF",
                  "LWF",
                  "RWF"
                ]),
              )
            ],
          ),
        ));
  }
}
