part of 'location_screen.dart';

extension LocationChildren on LocationScreen {
  Widget _searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: ContainerAppStyle().decorationSearchBox(),
      child: Row(
        children: [
          Image.asset(StringCommon.pathIconMap),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search location..."),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: ColorCommon.colorIconBlue),
            child: Center(
              child: Icon(
                Icons.search,
                color: ColorCommon.colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _radioBox() {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: ListTile(
  //             visualDensity: VisualDensity(horizontal: -4, vertical: -4),
  //             dense: true,
  //             contentPadding: EdgeInsets.all(0),
  //             horizontalTitleGap: 5,
  //             title: Text(
  //               "Final match field",
  //               style: TextAppStyle().styleNormal18Blue(),
  //             ),
  //             leading: Container(
  //               child: Radio(
  //                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                 value: Type.match,
  //                 groupValue: type,
  //                 activeColor: ColorCommon.colorIconRed,
  //                 onChanged: (dynamic value) {},
  //               ),
  //             ),
  //           ),
  //           flex: 2,
  //         ),
  //         Expanded(
  //           child: ListTile(
  //             visualDensity: VisualDensity(horizontal: -4, vertical: -4),
  //             dense: true,
  //             contentPadding: EdgeInsets.all(0),
  //             horizontalTitleGap: 5,
  //             trailing: Text(
  //               "Map",
  //               style: TextAppStyle().styleNormal18Blue(),
  //             ),
  //             title: Container(
  //               child: Align(
  //                 alignment: Alignment.centerRight,
  //                 child: Radio(
  //                   visualDensity: VisualDensity(horizontal: -4),
  //                   value: Type.map,
  //                   groupValue: type,
  //                   activeColor: ColorCommon.colorIconRed,
  //                   onChanged: (dynamic value) {},
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _listAddress() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: ContainerAppStyle().decorationItemListAddress(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(StringCommon.pathIconLocation),
                  ),
                  Text(
                    "Address",
                    style: TextAppStyle().styleBold15Blue(),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _listFinalMatch(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                NavigatorCommon.navigatorLeftToRight(
                    context: context,
                    goto: DialogLocationDetail(checkChangePick: true));
              },
              child: itemListFinalMatch());
        },
      ),
    );
  }
}
