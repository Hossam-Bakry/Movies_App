import 'package:flutter/material.dart';
import 'package:movies_app/moduls/browse/browse_screen.dart';
import 'package:movies_app/moduls/home/home_screen.dart';
import 'package:movies_app/moduls/search/search_screen.dart';
import 'package:movies_app/moduls/watch_list/watch_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = '';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomSheet: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(26, 26, 26, 1.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/ic_home.png')),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/ic_search.png')),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/ic_browse.png')),
              label: 'BROWSE',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/ic_watch_list.png')),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
    );
  }
}
