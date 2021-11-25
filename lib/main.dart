import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_attende.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_fill_me.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_detail/dialog_location_detail.dart';
import 'package:base_flutter_framework/components/dialog/dialog_live_match_tatics/dialog_team.dart';
import 'package:base_flutter_framework/core/models/profile.dart';
import 'package:base_flutter_framework/core/models/user_model.dart';
import 'package:base_flutter_framework/screens/home_main/home_main_screen.dart';
import 'package:base_flutter_framework/screens/live_match_detail/live_match_detail_page.dart';
// import 'package:base_flutter_framework/services/deep_link.dart';
import 'package:base_flutter_framework/screens/chat_ui/chat_ui_page.dart';
import 'package:base_flutter_framework/screens/final_match.dart/final_match_screen.dart';
import 'package:base_flutter_framework/screens/location/location_screen.dart';
import 'package:base_flutter_framework/screens/login_screen/login_page.dart';
import 'package:base_flutter_framework/screens/match_detail/match_detail_screen.dart';
import 'package:base_flutter_framework/screens/profile/profile_page.dart';
import 'package:base_flutter_framework/screens/profile/profile_screen.dart';
import 'package:base_flutter_framework/services/fcm.dart';
import 'package:base_flutter_framework/utils/shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/models/live_match_model.dart';
import 'screens/home_main/home_main_page.dart';
import 'translations/application.dart';
import 'utils/string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setUpMain();
  }

  void setUpMain() async {
    try {
      await Firebase.initializeApp();
      Shared.getInstance().userModel = UserModel();
      Shared.getInstance().userModel!.id = '123456789';
      // await FcmFirebase.getInstance()?.getFcmToken();
      // await FcmFirebase.getInstance()?.configFirebaseListener();
      // await Shared.getInstance().getUser();

      // if (Shared.getInstance().userModel.displayName != "" &&
      //     Shared.getInstance().userModel.active == true &&
      //     Shared.getInstance().userModel.displayName != null) {
      //   DeppLink.getInstance().setUpUniLinksString();
      //   Shared.getInstance().deleteCarsId();
      //   _isLogin = true;
      // } else {
      //   Shared.getInstance().deleteUser();
      // }

    } catch (_e) {}

    // await OnesignalConfig.getInstance()!.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: MaterialApp(
          title: 'Final match',
          // theme: ThemeData(fontFamily: StringCommon.fontHelveticarRegular),
          localizationsDelegates: [
            //provides localised strings
            GlobalMaterialLocalizations.delegate,
            //provides RTL support
            GlobalWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => HomeMainPage());
              default:
                return null;
            }
          },
          theme: ThemeData(fontFamily: "roboto"),
          supportedLocales: application.supportedLocales(),
          home: FutureBuilder(
            // Replace the 3 second delay with your initialization code:
            future: Future.delayed(Duration(seconds: 4)),
            builder: (context, AsyncSnapshot snapshot) {
              // Show splash screen while waiting for app resources to load:
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Splash();
              } else {
                // Loading is done, return the app:
                return Shared.getInstance().userModel != null
                    ? LoginPage()
                    : LoginPage();
                return LoginPage();
                //return HomeMainScreen();
                //return FinalMatchScreen();
                //return LocationScreen();
                //return DialogTeam();
                //return ProfileScreen();
                // return DialogLocationDetail(
                //   checkChangePick: true,
                // );
                // return MatchDetailScreen(
                //     liveMatch: LiveMatchModel(
                //         name: "Agnes Dare III",
                //         scoreHome: 7,
                //         scoreAway: 7,
                //         location: "61691 Enwin Locks",
                //         time: "Sun Jan 20 1991 23:13:58",
                //         money: 15000));
              }
            },
          )),
    );
  }
}

class Splash extends StatelessWidget {
  Widget background(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          StringCommon.pathBgLogoFlash,
          height: 200,
          width: 170,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: background(context),
      ),
    );
  }
}
