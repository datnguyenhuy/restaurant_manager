part of 'final_match_screen.dart';

extension FinalMatchChildren on FinalMatchScreen {
  Widget _tabBar(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(StringCommon.pathIconChampionLeague),
                    ),
                    Text(
                      "Detail",
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(StringCommon.pathIconClock),
                    ),
                    Text(
                      "Tatics",
                    ),
                  ],
                ),
              ),
            ],
            indicatorPadding: EdgeInsets.symmetric(horizontal: 35),
            indicatorWeight: 3,
            indicatorColor: ColorCommon.colorIconRed,
            labelColor: ColorCommon.colorIconRed,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(left: 45),
            unselectedLabelColor: ColorCommon.colorTitle,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          body: TabBarView(children: [
            tabBarDetail(context),
            tabBarTatics(context),
          ]),
        ),
      ),
    );
  }

  Widget tabBarDetail(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 510,
        padding: const EdgeInsets.all(17),
        decoration: ContainerAppStyle().decorationItemList(),
        margin: const EdgeInsets.only(top: 23, right: 18, left: 19),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: ColorCommon.colorIconRed,
                  ),
                  GestureDetector(
                      onTap: () {
                        NavigatorCommon.showDialogCommon(
                            context: context, child: DialogAttende());
                      },
                      child: boardResult(scoreHome: 7, scoreAway: 7)),
                  Container(
                    height: 20,
                    width: 20,
                    color: ColorCommon.colorGreen,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: listPersonOne()),
                  Expanded(
                    child: infor(context),
                    flex: 5,
                  ),
                  Expanded(child: listPersonTwo())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listPersonOne() {
    return Container(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: circleWidgetBordered(
                child: Image.asset("assets/icons/avatar.png"),
                maxRadius: 22.5,
                widthBorder: 0,
                colorBorder: ColorCommon.colorWhite,
                background: ColorCommon.colorIconRed),
          );
        },
      ),
    );
  }

  Widget infor(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 80),
      child: Column(
        children: [
          informationMatch(
              location: "Ho Chi Minh",
              time: "Sat 10:20:25 07/11/2021",
              money: 10000, context:  context),
          logo(),
          Image.asset(StringCommon.pathIconArrowRed)
        ],
      ),
    );
  }

  Widget logo() {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: 25 * 3.14 / 180,
            child: Container(
              height: 76,
              width: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      bottomLeft: Radius.circular(45)),
                  color: ColorCommon.colorIconBlue),
              child: Center(
                child: Transform.rotate(
                  angle: -25 * 3.14 / 180,
                  child:
                      Text("R", style: TextAppStyle().styleVeryBold20White()),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Transform.rotate(
            angle: 25 * 3.14 / 180,
            child: Container(
              height: 76,
              width: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                  color: ColorCommon.colorIconRed),
              child: Center(
                child: Transform.rotate(
                  angle: -25 * 3.14 / 180,
                  child:
                      Text("S", style: TextAppStyle().styleVeryBold20White()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listPersonTwo() {
    return Container(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: circleWidgetBordered(
                child: Image.asset("assets/icons/avatar.png"),
                maxRadius: 22.5,
                widthBorder: 0,
                colorBorder: ColorCommon.colorWhite,
                background: ColorCommon.colorIconRed),
          );
        },
      ),
    );
  }

  Widget tabBarTatics(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            titleBox(context: context),
            SizedBox(
              height: 13,
            ),
            stadium(),
            SizedBox(
              height: 20,
            ),
            listVerticalAvatar()
          ],
        ),
      ),
    );
  }

  Widget titleBox({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        NavigatorCommon.showDialogCommon(context: context, child: DialogTeam());
      },
      child: Container(
        height: 116,
        margin: const EdgeInsets.only(top: 28, left: 20, right: 20),
        decoration: ContainerAppStyle().decorationItemList(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: title(),
            ),
            Align(
                alignment: Alignment.center,
                child: diagram(
                    numberOne: 3, numberTwo: 2, numberThree: 1, numberFour: 1)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(StringCommon.pathImageBallLeft),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(StringCommon.pathImageBallRight),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      width: 170,
      height: 30,
      decoration: BoxDecoration(
          color: ColorCommon.colorIconRed,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: HexColor('000000').withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 1))
          ]),
      child: Center(
          child: Text(
        "Formation",
        style: TextAppStyle().styleVeryBold20White(),
      )),
    );
  }

  Widget stadium() {
    return Container(
      width: 283,
      height: 391,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(StringCommon.pathImageStadium),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          avatarBorderWhite(avatar: "assets/icons/avatar.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                avatarBorderWhite(avatar: "assets/icons/avatar.png"),
                avatarBorderWhite(avatar: "assets/icons/avatar.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 59),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                avatarBorderWhite(avatar: "assets/icons/avatar.png"),
                avatarBorderWhite(avatar: "assets/icons/avatar.png"),
              ],
            ),
          ),
          avatarBorderWhite(avatar: "assets/icons/avatar.png"),
          avatarBorderWhite(avatar: "assets/icons/avatar.png"),
        ],
      ),
    );
  }

  Widget avatarBorderWhite({required String avatar}) {
    return circleWidgetBordered(
      child: Image.asset(avatar),
      maxRadius: 20.5,
      widthBorder: 2,
      colorBorder: ColorCommon.colorWhite,
    );
  }

  Widget avatarBorderRed({required String avatar}) {
    return circleWidgetBordered(
      child: Image.asset(avatar),
      maxRadius: 20.5,
      widthBorder: 2,
      colorBorder: ColorCommon.colorIconRed,
    );
  }

  Widget listVerticalAvatar() {
    return Container(
      width: 283,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          avatarBorderRed(avatar: "assets/icons/avatar.png"),
          avatarBorderRed(avatar: "assets/icons/avatar.png"),
          avatarBorderRed(avatar: "assets/icons/avatar.png"),
          avatarBorderRed(avatar: "assets/icons/avatar.png"),
          avatarBorderRed(avatar: "assets/icons/avatar.png"),
        ],
      ),
    );
  }
}
