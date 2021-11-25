import 'package:base_flutter_framework/components/widget/image.dart';
import 'package:base_flutter_framework/components/widget/text_regular.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:flutter/material.dart';

class ItemLoginSocial extends StatefulWidget {
  final String iconUrl;
  final String title;
  final Function() onClick;
  final Color color;
  const ItemLoginSocial(
      {Key? key,
      required this.iconUrl,
      required this.onClick,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  _ItemLoginSocialState createState() => _ItemLoginSocialState();
}

class _ItemLoginSocialState extends State<ItemLoginSocial> {
  Widget itemSocical() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: TextButton(
        onPressed: () {
          widget.onClick();
        },
        style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(double.infinity, 45),
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              // side: BorderSide(color: Colors.red)
            )),
        child: Row(
          children: [
            imageFromLocale(url: widget.iconUrl, width: 20, height: 20),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 50),
              child: textRegular(
                  color: Colors.white,
                  title: widget.title,
                  fontSize: DimensCommon.fontSizeMedium),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return itemSocical();
  }
}
