import 'package:flutter/material.dart';
import 'package:mountain_app/ListOfBottmIconsMenuPage.dart';
import 'package:mountain_app/ListOfPagesTabBar.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/TopRowOfMenuNav.dart';

import 'CirclePainter.dart';
import 'MyTabBar.dart';
import 'MyTabBarView.dart';

class MenuElementPageOfNav extends StatefulWidget {
  @override
  State<MenuElementPageOfNav> createState() => _MenuElementPageOfNavState();
}

class _MenuElementPageOfNavState extends State<MenuElementPageOfNav>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController Controller = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopRow(),
              TextDiscover(),
              MyTabBar(Controller: Controller),
              MyTabBarView(Controller: Controller),
              ExploreAndSeeAllText(),
              ListViewOfBottomIcons()
            ],
          ),
        ),
      ),
    );
  }

  Row ExploreAndSeeAllText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 0),
          child: Text(
            "Explore more",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 0.0, top: 0, bottom: 0, right: 25.0),
          child: Text(
            "See all",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Padding TextDiscover() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 20, right: 25),
      child: Text(
        "Discover",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}

class ListViewOfBottomIcons extends StatelessWidget {
  const ListViewOfBottomIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int LengthOfList = ListOfBottomIcons.length;
    return Container(
      height: 100,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int tall = ListOfBottomIcons[index].length;
          String name = ListOfBottomIcons[index].substring(14, tall - 4);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    ListOfBottomIcons[index],
                  ),
                  fit: BoxFit.cover,
                  height: 60,
                ),
                Text(name, style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
        },
        itemCount: ListOfBottomIcons.length,
      ),
    );
  }
}
