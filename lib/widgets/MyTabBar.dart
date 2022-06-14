import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'CirclePainter.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
    required this.Controller,
  }) : super(key: key);

  final TabController Controller;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(left: 10),
      width: double.maxFinite,
      height: 40,
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        controller: Controller,
        tabs: [
          Tab(child: Text("Places")),
          Tab(child: Text("Inspiration")),
          Tab(child: Text("Emotion")),
        ],
      ),
    );
  }
}
