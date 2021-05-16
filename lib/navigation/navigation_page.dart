import 'package:flutter/material.dart';

import 'package:hci_m3_app/pages/home_page.dart';
import 'package:hci_m3_app/pages/info_page.dart';
import 'package:hci_m3_app/pages/maps_page.dart';
import 'package:hci_m3_app/pages/settings_page.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

// when a BottomNavigationBarItem is taped _currentIndex is set
//to the respective index and the body is updated to the corresponding screen
class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  var _screens = [HomePage(), InfoPage(), MapsPage(), SettingsPage()];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        iconSize: 30,
        items: bottomNavigationItems,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
          _pageController.jumpToPage(newIndex);
        },
      ),
    );
  }
}

// here are the BottomNavigationBarItems
var bottomNavigationItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_outline),
    label: "Info",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map_outlined),
    label: "Maps",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "Settings",
  )
];