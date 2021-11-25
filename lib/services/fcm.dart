import 'dart:async';
import 'dart:collection';

import 'package:base_flutter_framework/services/service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class FcmFirebase {
  static FcmFirebase? instance;

  String? token;

  static FcmFirebase? getInstance() {
    if (instance == null) instance = new FcmFirebase();
    return instance;
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  // ignore: unused_element
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }

  /// Create a [AndroidNotificationChannel] for heads up notifications
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  Future<void> configFirebaseListener() async {
    // _pushNotification = PushNotification(context);

    // await _pushNotification!.onUpdateUserTokenActionRegistered(token!);
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: true,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (value) async {
        navService.pushNamed('/message', args: 'From Home Screen');
      },
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        navService.pushNamed('/message', args: 'From Home Screen');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
       
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      navService.pushNamed('/message', args: 'From Home Screen');
    });
  }

  Future<void> firebaseMessagesForeGroundHandler(RemoteMessage message) async {}

  Future<void> getFcmToken() async {
    // FirebaseMessaging.instance.deleteToken();
    this.token = await FirebaseMessaging.instance.getToken();
    print(token);
    // FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
    //   this.token = event;
    //   // updateToken();
    // });
  }

  // updateToken() async {
  //   await getFcmToken();
  //   Map<String, dynamic> param = new HashMap();
  //   param.putIfAbsent("fcmToken", () => this.token);
  //   Response? response = await ServiceCommon.getInstance()!.patch(
  //       api: "/fcmtoken",
  //       host: CheckVersion.getInstance()!.config!.customerUrl,
  //       param: param);
  //   // Shared.getInstance().userModel!.fcmToken = this.;
  //   // await Shared.getInstance().saveUser(user: Shared.getInstance().userModel!);
  //   print(response);
  // }
}
