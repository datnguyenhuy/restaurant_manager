import 'package:flutter/material.dart';

import 'live_match_detail_screen.dart';

class LiveMatchDetailPage extends StatefulWidget {
  const LiveMatchDetailPage({ Key? key }) : super(key: key);

  @override
  _LiveMatchDetailPageState createState() => _LiveMatchDetailPageState();
}

class _LiveMatchDetailPageState extends State<LiveMatchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return LiveMatchDetailScreen();
  }
}