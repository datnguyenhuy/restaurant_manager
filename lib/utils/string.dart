import 'package:intl/intl.dart';

class StringCommon {
  ///File path
  static const String pathBgLogoFlash = "assets/images/logo.png";
  static const String pathIconMessagerFacebook = "assets/icons/messenger.svg";
  static const String pathBgHeaderApp = "assets/images/bg_app_header.jpg";
  static const String pathKeyIconSellHouse = "assets/icons/icon_sell_house.png";
  static const String pathKeyIconRentHouse = "assets/icons/icon_rent_house.png";
  static const String pathKeyIconTransferHouse =
      "assets/icons/icon_tranfer_house.png";
  static const String pathIconSetting = "assets/icons/settings.svg";
  static const String pathIconCalendar = "assets/icons/calendar.svg";

  static const String pathIconGoogle = "assets/icons/icon_google.png";
  static const String pathIconFacebook = "assets/icons/icon_fb.png";
  static const String pathIconApple = "assets/icons/icon_apple.png";
  static const String pathIconEdit = "assets/icons/edit.png";
  static const String pathIconLocation = "assets/icons/location.png";
  static const String pathIconTime = "assets/icons/Vector.png";
  static const String pathIconMoney = "assets/icons/Union.png";
  static const String pathIconChampionLeague =
      "assets/icons/champion_league.png";
  static const String pathIconClock = "assets/icons/clock.png";
  static const String pathIconForward = "assets/icons/forward.png";
  static const String pathIconAccount = "assets/icons/account.png";
  static const String pathIconMale = "assets/icons/male.png";
  static const String pathIconFemale = "assets/icons/female.png";
  static const String pathIconLeg = "assets/icons/leg.png";
  static const String pathIconPhone = "assets/icons/phone.png";
  static const String pathIconWeightHeight = "assets/icons/weight_height.png";
  static const String pathIconFavorite = "assets/icons/favorite.png";
  static const String pathIconArrowRed = "assets/icons/arrow_red.png";
  static const String pathIconMap = "assets/icons/map.png";
  static const String pathIconCall = "assets/icons/call.png";
  static const String pathIconLike = "assets/icons/like.png";
  static const String pathIconDoubleArrow = "assets/icons/double_arrow.png";
  static const String pathIconCheck = "assets/icons/check.png";
  static const String pathIconLine = "assets/icons/line.png";
  static const String pathIconStadium = "assets/icons/icon_stadium.png";
  static const String pathIconChangePick = "assets/icons/change_pick.png";
  static const String pathImageMessi = "assets/icons/messi.png";
  static const String pathImageBallLeft = "assets/icons/ball_left.png";
  static const String pathImageBallRight = "assets/icons/ball_right.png";
  static const String pathImageStadium = "assets/icons/stadium.png";
  static const String pathImageBall = "assets/icons/ball.png";
  static const String pathAvatarCommon = "assets/icons/avatar.png";

  //static const String = "";

  static const String beforeHour = "時間前";
  static const String beforeMinute = "分前";
  static const String fewSecondAgo = "数秒前";
  static const String beforeDayAgo = "日前";

  ///format
  static const String datePattern3 = "yyyy-MM-dd HH:mm:ss";
  static String formatDecimal(int count) {
    final formatter = new NumberFormat("#,###");
    return formatter.format(count);
  }

  static const hostImageCarEdit = "http://45.76.209.56:9090/images";
  static const hostShareUrl = "https://mg.i-car.jp/spec/";
  static const userCache = "USER";

  //language

  static const String errorConnect = "Lỗi kết nối vui lòng thử lại sau";
  static const String sendRequestAddRoom = " sent you a new friend request ";

  static const String invitations = 'Invitations';
  static const String accept = 'Accept';
  static const String delete = 'Delete';
  static const String appName = 'Final match';
  static const String searchLocation = 'Search location';
  static const String fillMe = 'Fill me please';
  static const String attende = 'Attende';
  static const String locationDetail = 'Location Detail';

  static const String result = 'Result';
  static const String doYouScore = 'Do you score?';

  // title
  static const String gender = 'Gender';
  static const String leg = 'Leg';
  static const String phoneNumber = 'Phone Number';
  static const String heiWei = 'Height - Weight';

  // text
  static const String score = "SCORE";
  static const String win = "WIN";
  static const String loss = "LOSS";
  static const String draw = "DRAW";
  static const String rematch = "REMATCH";
  static const String sub = "SUB";
}
