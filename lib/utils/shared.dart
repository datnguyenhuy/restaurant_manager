import 'dart:convert';
// import 'package:base_flutter_framework/core/models/user.dart';
import 'package:base_flutter_framework/core/models/user_model.dart';
import 'package:base_flutter_framework/utils/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

//cache file
class Shared {
  static Shared? instance;
  static Shared getInstance() {
    if (instance == null) {
      instance = new Shared();
    }
    return instance!;
  }

  UserModel? userModel;

  Future<bool> saveUser({required UserModel user}) async {
    await deleteUser();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userModel = user;
    await preferences.setString(
        StringCommon.userCache, jsonEncode(this.userModel!.toMap()));
    print(userModel);
    return true;
  }

  Future<bool> deleteUser() async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();

    // await FcmFirebase.getInstance()!.;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(StringCommon.userCache);
    userModel = null;
    // await deleteNiceArticle();
    return true;
  }

  Future<UserModel?> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(StringCommon.userCache)) {
      userModel = UserModel.fromJson(
          jsonDecode(preferences.getString(StringCommon.userCache)!));

      return userModel;
    }
    return null;
  }
}
