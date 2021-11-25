import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:base_flutter_framework/core/models/user_model.dart';
import 'package:base_flutter_framework/services/fcm.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:base_flutter_framework/services/service.dart';
import 'package:base_flutter_framework/utils/shared.dart';
import 'package:base_flutter_framework/utils/valid.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginRepository {
  // checkPass({required String userName, required String pass}) async {
  //   Map<String, dynamic> param = new HashMap();
  //   try {
  //     param.putIfAbsent("phone", () => userName);
  //     param.putIfAbsent("password", () => pass);
  //     Response? response = await ServiceCommon.getInstance()!.postHttp(
  //         api: "/phones",
  //         host: CheckVersion.getInstance()!.config!.customerUrl,
  //         param: param);
  //     if (response!.data["msg"] != "NOT FOUND") {
  //       return true;
  //     }
  //     return false;
  //   } catch (_e) {
  //     return false;
  //   }
  // }

  Future<bool> loginWithFacebook() async {
    // Trigger the sign-in flow
    // ignore: invalid_use_of_visible_for_testing_member
    // Trigger the sign-in flow
    // ignore: invalid_use_of_visible_for_testing_member
    final result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    // get the user data
    final userData = await FacebookAuth.instance.getUserData();
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();

    // var response =
    //     await http.get(url, headers: {'Authorization': "Bearer $token"});
    Map<String, dynamic> param = new HashMap();
    param.putIfAbsent('type', () => "facebook");
    param.putIfAbsent('access_token', () => token);
    param.putIfAbsent(
        'name', () => FirebaseAuth.instance.currentUser!.displayName);
    param.putIfAbsent('email', () => FirebaseAuth.instance.currentUser!.email);
    param.putIfAbsent(
        'url_avatar', () => FirebaseAuth.instance.currentUser!.photoURL);
    param.putIfAbsent('user_id', () => FirebaseAuth.instance.currentUser!.uid);
    Response? response = await ServiceCommon.getInstance()!.postHttp(
        api: ServiceCommon.getInstance()!.modeLoginGoogle,
        param: param,
        host: ServiceCommon.getInstance()!.severUrl);
    await Shared.getInstance()
        .saveUser(user: UserModel.fromJson(response!.data['data']));
    // await MqttClientService.getInstance()!.connect();
    // CheckVersion.getInstance()!.ping();
    print(userData);

    return true;
  }

  loginGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    Map<String, dynamic> param = new HashMap();

    await FcmFirebase.getInstance()?.getFcmToken();

    param.putIfAbsent('type', () => "google");
    param.putIfAbsent('access_token', () => token);
    param.putIfAbsent(
        'name', () => FirebaseAuth.instance.currentUser!.displayName);
    param.putIfAbsent('email', () => FirebaseAuth.instance.currentUser!.email);
    param.putIfAbsent(
        'url_avatar', () => FirebaseAuth.instance.currentUser!.photoURL);
    param.putIfAbsent('user_id', () => FirebaseAuth.instance.currentUser!.uid);
    Response? response = await ServiceCommon.getInstance()!.postHttp(
        api: ServiceCommon.getInstance()!.modeLoginGoogle,
        param: param,
        host: ServiceCommon.getInstance()!.severUrl);
    print(response);

    await Shared.getInstance()
        .saveUser(user: UserModel.fromJson(response!.data['data']));

    // await MqttClientService.getInstance()!.connect();
    // CheckVersion.getInstance()!.ping();
    return true;
  }

  // Future<AuthorizationCredentialAppleID?> getCredentialApple() async {
  //   bool availbleSupport = await SignInWithApple.isAvailable();
  //   if (availbleSupport) {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     return credential;
  //   }
  //   return null;
  // }

  // loginApple() async {
  //   AuthorizationCredentialAppleID? profileAplle = await getCredentialApple();

  //   if (profileAplle != null) {
  //     try {
  //       // Create an `OAuthCredential` from the credential returned by Apple.
  //       final oauthCredential = OAuthProvider("apple.com").credential(
  //           idToken: profileAplle.identityToken,
  //           accessToken: profileAplle.authorizationCode);

  //       await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  //       if (profileAplle.email != null) {
  //         await FirebaseAuth.instance.currentUser!.updateProfile(
  //             displayName:
  //                 profileAplle.givenName! + " " + profileAplle.familyName!);
  //       }

  //       await Shared.getInstance()
  //           .saveUser(user: UserModel.fromJson(response.data));
  //       await FcmFirebase.getInstance()!.configFirebaseListener();

  //       // await MqttClientService.getInstance()!.connect();
  //       // CheckVersion.getInstance()!.ping();

  //       return true;
  //     } catch (_e) {
  //       return false;
  //     }
  //   }
  // }

  // static Future<void> refreshToken() async {
  //   Response? response = await ServiceCommon.getInstance()!.postHttp(
  //       api: ServiceCommon.getInstance()!.modeRefreshToken,
  //       host: CheckVersion.getInstance()!.config!.appSever);
  //   Shared.getInstance().userModel!.token = response!.data["token"];
  //   await Shared.getInstance().saveUser(user: Shared.getInstance().userModel!);
  //   print(response);
  // }
}
