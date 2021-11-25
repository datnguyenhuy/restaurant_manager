import 'package:base_flutter_framework/utils/color.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:base_flutter_framework/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanelUp extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Widget Function(ScrollController controller) child;
  final String title;

  final bool autoEnableScrollController;
  SlidingPanelUp(
      {Key? key,
      required this.child,
      required this.title,
      required this.autoEnableScrollController})
      : super(key: key);

  @override
  _SlidingPanelUpState createState() => _SlidingPanelUpState();
}

class _SlidingPanelUpState extends State<SlidingPanelUp> {
  Widget panel(ScrollController scrollController) {
    return SingleChildScrollView(
      // height: DimensCommon.sizeHeight(context: context),
      controller:
          widget.autoEnableScrollController == true ? scrollController : null,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              margin: EdgeInsets.only(top: 15, bottom: 20),
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: ColorCommon.slidingUp,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                widget.title,
                style: TextAppStyle().textTitleBottomSheetStyle(),
              ),
            ),
            Container(child: widget.child(scrollController))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        maxHeight: DimensCommon.sizeHeight(context: context) - 100,
        minHeight: 50,
        parallaxEnabled: true,
        parallaxOffset: .5,
        padding: EdgeInsets.all(0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        margin: EdgeInsets.all(0),
        panelBuilder: (sc) => panel(sc));
  }
}
