import 'package:flutter/material.dart';

import 'chat_ui_screen.dart';

class CHatUIPage extends StatefulWidget {
  const CHatUIPage({Key? key}) : super(key: key);

  @override
  _CHatUIPageState createState() => _CHatUIPageState();
}

class _CHatUIPageState extends State<CHatUIPage> {
  @override
  Widget build(BuildContext context) {
    return ChatUiScreen();
  }
}
