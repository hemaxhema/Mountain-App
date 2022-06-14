import 'package:flutter/material.dart';

import 'TabsOfListView/Places.dart';

List<Widget> ListOfPagesTabBar = [
  PlaceTab(),
  Container(
    child: Center(
      child: Text("Inspiration"),
    ),
  ),
  Container(
    child: Center(
      child: Text("Emotions"),
    ),
  )
];
