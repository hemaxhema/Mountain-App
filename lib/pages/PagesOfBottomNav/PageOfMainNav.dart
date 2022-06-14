import 'package:flutter/material.dart';
import 'package:mountain_app/widgets/MenuElementPageOfNav.dart';
import 'package:mountain_app/pages/PagesOfBottomNav/PageOfChart.dart';
import 'package:mountain_app/pages/PagesOfBottomNav/PageOfPerson.dart';
import 'package:mountain_app/pages/PagesOfBottomNav/PageOfSearch.dart';

class PageOfMainNav extends StatefulWidget {
  const PageOfMainNav({Key? key}) : super(key: key);
  static const id = "PageOfMainNav";

  @override
  _PageOfMainNavState createState() => _PageOfMainNavState();
}

class _PageOfMainNavState extends State<PageOfMainNav> {
  int SelectedItem = 0;

  void ontapBottomNav(int index) {
    setState(() {
      SelectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> PagesOfNav = [
      MenuElementPageOfNav(),
      PageOfChart(),
      PageOfSearch(),
      PageOfPerson()
    ];

    return Scaffold(
      body: Center(
        child: PagesOfNav[SelectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: SelectedItem,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart_sharp), label: "chart"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "person"),
          ],
          elevation: 10,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          onTap: ontapBottomNav),
    );
  }
}
