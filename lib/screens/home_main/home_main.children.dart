part of 'home_main_screen.dart';

extension _HomeScreenChildern on HomeMainScreen {
  Widget itemAddFriendRequest(String icon, String data) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 6),
              child: imageFromLocale(url: icon, width: null, height: null)),
          Expanded(
              child: Text(
            data,
            style: TextAppStyle().textStyleInfo(),
          ))
        ],
      ),
    );
  }

  Widget itemInvitationsConnect(Invitations invitations, BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: ContainerAppStyle().containerRadius(
          ColorCommon.colorGreyItem,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: circleAvatar(
                      border:
                          Border.all(color: ColorCommon.colorName, width: 1),
                      child: imageFromNetWork(
                          url: invitations.avatar, width: 40, height: 40)),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 4),
                        child: RichText(
                          text: new TextSpan(text: null, children: [
                            new TextSpan(
                                text: invitations.name,
                                style: TextAppStyle().textStyleName()),
                            new TextSpan(
                                text: StringCommon.sendRequestAddRoom,
                                style: TextAppStyle().textStyleNormal())
                          ]),
                        ),
                      ),
                      itemAddFriendRequest(
                          ResourceApp().iconLocation, invitations.location),
                      itemAddFriendRequest(
                          ResourceApp().iconClock, invitations.time),
                    ],
                  ),
                ))
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          child: buttonNoIcon(
                              title: StringCommon.accept,
                              colorBackground: ColorCommon.colorButtonYes,
                              textColor: Colors.white,
                              radius: 10,
                              onclick: () {},
                              padding: EdgeInsets.zero),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          child: buttonNoIcon(
                              title: StringCommon.delete,
                              colorBackground: ColorCommon.colorButtonNo,
                              textColor: Colors.white,
                              radius: 10,
                              onclick: () {},
                              padding: EdgeInsets.zero),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }

  Widget listInvitations(ScrollController controller, BuildContext context) {
    List<Invitations> datas = [];

    datas.add(Invitations(
        time: "2 day ago",
        avatar: "http://i1.taimienphi.vn/tmp/cf/aut/hinh-anh-nguoi-mau.jpg",
        location: "Hà Nội",
        name: "MrDavid"));

    return ListView.builder(
        itemCount: 100,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        // controller: controller,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return itemInvitationsConnect(datas[0], context);
        });
  }

  Widget buttonInviatation(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HomeRepository().getInvitations();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorCommon.colorButton,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.email_outlined,
                      color: ColorCommon.colorWhite,
                    ),
                  ),
                  Text(
                    "Inviatation",
                    style: TextStyle(
                        color: ColorCommon.colorTextWhite,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Align(
              heightFactor: 15,
              widthFactor: 15,
              alignment: Alignment.topRight,
              child: circleWidgetBordered(
                maxRadius: 7.5,
                widthBorder: 1,
                colorBorder: ColorCommon.colorWhite,
                background: ColorCommon.colorIconRed,
                child: Container(
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget avatar({required BuildContext context}) {
    return Container(
      width: 45,
      height: 45,
      child: Stack(
        children: [
          Container(
            child: circleWidgetBordered(
                onTap: () {
                  NavigatorCommon.navigatorLeftToRight(
                      context: context, goto: ProfileScreen());
                },
                child: Image.asset("assets/icons/test.png"),
                maxRadius: 22.5,
                widthBorder: 2,
                colorBorder: ColorCommon.colorButton,
                background: ColorCommon.colorIconRed),
          ),
          Align(
            heightFactor: 16,
            widthFactor: 16,
            alignment: Alignment.bottomRight,
            child: circleWidgetBordered(
                maxRadius: 8,
                widthBorder: 1,
                colorBorder: ColorCommon.colorIconEdit,
                background: ColorCommon.colorWhite,
                child: Image.asset(StringCommon.pathIconEdit)),
          )
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: ColorCommon.colorWhite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [buttonInviatation(context), avatar(context: context)],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  StringCommon.pathIconLocation,
                  color: ColorCommon.colorTitle,
                ),
                Text(
                  "247 Johnston Ferry",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorCommon.colorTitle),
                ),
                TextButton(
                  onPressed: () {
                    NavigatorCommon.navigatorLeftToRight(
                        context: context, goto: SearchLocationPage());
                  },
                  style: ButtonAppStyle().buttonWrap(),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.search,
                      color: ColorCommon.colorWhite,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tabBar() {
    return Container(
      child: DefaultTabController(
        initialIndex: 0,
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
                      "Live Match",
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
                      "History Match",
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
          body: TabBarView(
            children: [
              Container(
                color: HexColor("E5E5E5"),
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        NavigatorCommon.navigatorLeftToRight(
                            context: context, goto: FinalMatchScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: HexColor("FFFEFE"),
                        ),
                        child: itemListLiveMatch(
                            liveMatch: LiveMatchModel(
                              name: "Agnes Dare III",
                              scoreHome: 7,
                              scoreAway: 7,
                              location: "61691 Enwin Locks",
                              time: "Sun Jan 20 1991 23:13:58 GMT+0700",
                              money: 15000,
                            ),
                            context: context),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: HexColor("E5E5E5"),
                padding: const EdgeInsets.only(top: 20, left: 20, right: 13),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        NavigatorCommon.navigatorLeftToRight(
                            context: context,
                            goto: MatchDetailScreen(
                                liveMatch: LiveMatchModel(
                                    name: "Agnes Dare III",
                                    scoreHome: 7,
                                    scoreAway: 7,
                                    location: "61691 Enwin Locks",
                                    time: "Sun Jan 20 1991 23:13:58 GMT+0700",
                                    money: 15000)));
                      },
                      style: ButtonAppStyle().buttonWrap(),
                      child: Container(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: HexColor("FFFEFE"),
                                ),
                                child: itemListHistoryMatch(
                                    liveMatch: LiveMatchModel(
                                        name: "Agnes Dare III",
                                        scoreHome: 7,
                                        scoreAway: 7,
                                        location: "61691 Enwin Locks",
                                        time:
                                            "Sun Jan 20 1991 23:13:58 GMT+0700",
                                        money: 15000),
                                    context: context),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 96,
                              child: winDrawLow(
                                title: StringCommon.win,
                                colorMain: ColorCommon.colorBoxWin,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemLiveMatchNow() {
    return Container(
        decoration: ContainerAppStyle().decorationItemList(),
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.topCenter,
                child: imageFromLocale(
                    url: StringCommon.pathImageBallRight,
                    width: 30,
                    height: 30)),
            Expanded(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "MU vs MC",
                  style: TextAppStyle().styleVeryBold15Black(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "61691 Erwin Locks",
                  style: TextAppStyle().styleNormal15Black(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sun Jan 20 1991 23:13:58",
                  style: TextAppStyle().styleNormal15Black(),
                ),
              ),
            ]))
          ],
        ));
  }
}
