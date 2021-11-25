part of 'search_location_screen.dart';

extension _SearchLocationChildren on SearchLocationScreen {
  Widget _toolBar(BuildContext context) {
    return toolBarCommon(
        context: context,
        background: Colors.white,
        child:
            Text(StringCommon.appName, style: TextAppStyle().textStyleAppBar()),
        onclickIcon: () {
          Navigator.pop(context);
        });
  }

  Widget _searchBar(TextEditingController controller) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: searchBox(
          hintText: StringCommon.searchLocation,
          searchComfirm: (text) {},
          controller: controller,
          icon: controller.text.isNotEmpty
              ? Icon(
                  Icons.location_pin,
                  color: ColorCommon.colorRed,
                  size: 30,
                )
              : imageFromLocale(
                  url: ResourceApp().iconGoogle, width: null, height: null)),
    );
  }

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
        avatar:
            "https://pickaface.net/gallery/avatar/unr_therock_161212_1517_9o0ll4.png",
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

Widget _itemSearch({required String title}){
  return Container(
      margin: EdgeInsets.only(bottom: 10),
    child: Card(
      elevation: 2,
      child: Container(
        height:60,
      
        child: Row(
          children: [
            Container(
              margin:EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Icon(
                      Icons.location_pin,
                      color: ColorCommon.colorName,
                      size: 20,
                    ),
            ), Expanded(child: Text(title, style: TextAppStyle().textStyleItemSearch(),))
          ],
        )
      )
    ),
  );
}
  Widget listSearchLocation() {
  

    return Expanded(
      child: ListView.builder(
          itemCount: 100,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 60),
          // controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemSearch(title: "282 Minh Khai, Hà Nội");
          }),
    );
  }
}
