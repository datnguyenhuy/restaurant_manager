part of "profile_screen.dart";

extension ProfileChildren on ProfileScreen {
  Widget _avatar({required PlayerStatistic playerStatistic}) {
    return Container(
      width: 130,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Image.asset(
            playerStatistic.avatar ?? StringCommon.pathIconLocation,
            height: 182,
          ),
          Text(
            "Match Complete: " +
                (playerStatistic.matchComplete ?? " ").toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            "Win:" +
                (playerStatistic.win ?? " ").toString() +
                " | Low:" +
                (playerStatistic.low ?? " ").toString() +
                " | Draw:" +
                (playerStatistic.draw ?? " ").toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: ((playerStatistic.win ?? 0) * 130) /
                      playerStatistic.matchComplete!,
                  height: 12,
                  color: ColorCommon.colorButton,
                ),
                Container(
                  width: ((playerStatistic.draw ?? 0) * 130) /
                      playerStatistic.matchComplete!,
                  height: 12,
                  color: HexColor("DADADA"),
                ),
                Container(
                  width: ((playerStatistic.low ?? 0) * 130) /
                      playerStatistic.matchComplete!,
                  height: 12,
                  color: ColorCommon.colorIconRed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _indexPerson({required PlayerStatistic playerStatistic}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorCommon.colorWhite,
          boxShadow: _boxShadow()),
      child: Column(
        children: [
          Container(
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: ColorCommon.colorButton,
            ),
            child: Center(
              child: Text(
                playerStatistic.name,
                style: TextAppStyle().styleVeryBold15White(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _itemIndexPerson(
                        title: "Height",
                        index: playerStatistic.height.toString() + "cm"),
                    _itemIndexPerson(
                        title: "Weight",
                        index: playerStatistic.weight.toString() + "lbs"),
                    _itemIndexPerson(
                        title: "Strongleg",
                        index: playerStatistic.strongLeg.toString()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _itemIndexPerson(
                        title: "BMI", index: playerStatistic.BMI.toString()),
                    _itemIndexPerson(
                        title: "Age", index: playerStatistic.age.toString()),
                    _itemIndexPerson(
                        title: "Location",
                        index: playerStatistic.location.toString()),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemIndexPerson({required String title, required String index}) {
    return Container(
      padding: EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Text(
            title + ":",
            style: TextAppStyle().styleVeryBold15Red(),
          ),
          Text(
            index,
            style: TextAppStyle().styleNormal15Blue(),
          )
        ],
      ),
    );
  }

  Widget _indexFootBall({required PlayerStatistic playerStatistic}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: _boxShadow()),
      child: Column(
        children: [
          Container(
            height: 25,
            decoration: BoxDecoration(color: ColorCommon.colorButton),
            child: Center(
              child: Text(
                "Index",
                style: TextAppStyle().styleVeryBold15White(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                _itemIndexFootBall(
                    title: "LB: " + playerStatistic.indexLB.toString(),
                    index: playerStatistic.percentLB!),
                _itemIndexFootBall(
                    title: "RB: " + playerStatistic.indexRB.toString(),
                    index: playerStatistic.percentRB!),
                _itemIndexFootBall(
                    title: "CB: " + playerStatistic.indexCB.toString(),
                    index: playerStatistic.percentCB!)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemIndexFootBall({required String title, required int index}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            child: Text(
              title,
              style: TextAppStyle().styleVeryBold15Black(),
            ),
          ),
          Container(
            height: 15,
            width: 150,
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                        width: index / 100 * 150,
                        height: 15,
                        color: ColorCommon.colorButton),
                    Expanded(
                      child: Container(
                        color: HexColor("5077AF"),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    index.toString() + "%",
                    style: TextAppStyle().styleVeryBold10White(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget content({required PlayerStatistic playerStatistic}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorCommon.colorWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _boxShadow()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _avatar(playerStatistic: playerStatistic),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  _indexPerson(
                    playerStatistic: playerStatistic,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: _indexFootBall(
                      playerStatistic: playerStatistic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BoxShadow> _boxShadow() {
    return [
      BoxShadow(
          color: HexColor("000000").withOpacity(0.1),
          offset: Offset(0, 1),
          blurRadius: 4)
    ];
  }

  Widget _option(
      {required String pathIcon,
      required String title,
      required void Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: _boxShadow()),
        child: Row(
          children: [
            Expanded(child: Image.asset(pathIcon)),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: TextAppStyle().styleVeryBold15Blue(),
                ),
              ),
              flex: 6,
            ),
            Expanded(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: ColorCommon.colorIconRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
