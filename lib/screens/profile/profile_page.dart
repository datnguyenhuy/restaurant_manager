import 'package:base_flutter_framework/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}