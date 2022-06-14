import 'package:flutter/material.dart';

import '../ListOfPagesTabBar.dart';

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({
    Key? key,
    required this.Controller,
  }) : super(key: key);

  final TabController Controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      child: TabBarView(
        controller: Controller,
        children: ListOfPagesTabBar,
      ),
    );
  }
}
