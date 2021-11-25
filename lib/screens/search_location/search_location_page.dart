import 'package:flutter/material.dart';

import 'search_location_screen.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({ Key? key }) : super(key: key);

  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  @override
  Widget build(BuildContext context) {
    return SearchLocationScreen();
  }
}