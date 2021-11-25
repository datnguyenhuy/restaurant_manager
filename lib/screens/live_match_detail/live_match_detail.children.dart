part of 'live_match_detail_screen.dart';

extension _LiveMatchDetailChildren on LiveMatchDetailScreen{

  Widget _toolBar(){
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(StringCommon.appName, style: TextAppStyle().textStyleAppBar(),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  width: DimensCommon.sizeBackButton,
                  child: TextButton(
                    onPressed: (){},
                    style: ButtonAppStyle().buttonWrap(),
                    child: imageFromLocale(url: ResourceApp().iconLeaveRoom, width: null, height: null),
                  )
                )
              ],
            ),
          ],
        ),
      );
  }

}