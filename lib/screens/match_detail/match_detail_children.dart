part of 'match_detail_screen.dart';

extension MatchDetailChildren on MatchDetailScreen {
  Widget informationBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 23, bottom: 17, left: 19, right: 22),
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      decoration: ContainerAppStyle().decorationItemList(),
      child: Column(
        children: [
          header(liveMatch: liveMatch),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: informationMatch(
                location: liveMatch.location,
                time: liveMatch.time,
                money: liveMatch.money, 
                context: context),
          ),
        ],
      ),
    );
  }

  Widget _rowBoxNumber(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              boxNumber(
                  bgColor: ColorCommon.colorPink2,
                  title: StringCommon.win,
                  number: 20),
              border(),
              boxNumber(
                  bgColor: ColorCommon.colorPink3,
                  title: StringCommon.loss,
                  number: 40),
              border(),
              boxNumber(
                  bgColor: ColorCommon.colorPink4,
                  title: StringCommon.draw,
                  number: 20),
            ],
          ),
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
                color: ColorCommon.colorIconBlue,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                StringCommon.rematch,
                style: TextAppStyle().styleBold12White(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget border() {
    return Container(
      width: 1,
      height: 70,
      color: ColorCommon.colorBorder,
    );
  }

  Widget boxNumber(
      {required Color bgColor, required String title, required int number}) {
    return Container(
      width: 70,
      height: 70,
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextAppStyle().styleBold12White(),
          ),
          Text(
            number.toString(),
            style: TextAppStyle().styleBold30White(),
          )
        ],
      ),
    );
  }

  Widget listMember() {
    return Container(
      margin: const EdgeInsets.only(top: 36, left: 20, right: 20),
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return itemListMember();
          }),
    );
  }

  Widget itemListMember() {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(bottom: 17),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: ContainerAppStyle().decorationItemListDetailMatch(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leading(), title(), trailing()],
      ),
    );
  }

  Widget leading() {
    return Container(
      width: 65,
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: circleWidgetBordered(
              child: Image.asset("assets/icons/avatar.png"),
              maxRadius: 23.5,
              widthBorder: 3,
              colorBorder: ColorCommon.colorIconRed,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: circleWidgetBordered(
                  child: Image.asset(StringCommon.pathImageBall),
                  maxRadius: 6.5,
                  widthBorder: 1,
                  colorBorder: ColorCommon.colorWhite,
                  background: ColorCommon.colorWhite),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: sub(),
          )
        ],
      ),
    );
  }

  Widget sub() {
    return Container(
      width: 27,
      height: 19,
      decoration: ContainerAppStyle().decorationBoxSub(),
      child: Center(
          child: Text("SUB", style: TextAppStyle().styleNormal10White())),
    );
  }

  Widget title() {
    return Container(
      child: Column(
        children: [
          Text(
            "Michele Effertz",
            style: TextAppStyle().styleNormal15Black(),
          ),
          Text(
            "Home",
            style: TextAppStyle().styleNormal12Black(),
          ),
          Container(
            width: 48,
            height: 16,
            decoration: ContainerAppStyle().decorationBoxWin(),
            child: Center(
              child: Text(
                StringCommon.win,
                style: TextAppStyle().styleNormal12White(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget trailing() {
    return Container(
      child: Row(
        children: [
          Text("INVITE", style: TextAppStyle().styleVeryBold12Red()),
          SizedBox(
            width: 10,
          ),
          Image.asset(StringCommon.pathIconDoubleArrow)
        ],
      ),
    );
  }
}
