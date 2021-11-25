import 'package:flutter/material.dart';

class LiveMatchModel {
  String name;
  int scoreHome;
  int scoreAway;
  String location;
  String time;
  double money;
  Widget? avatar;
  LiveMatchModel(
      {required this.name,
      required this.scoreHome,
      required this.scoreAway,
      required this.location,
      required this.time,
      required this.money,
      this.avatar});
}
