import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:hci_m3_app/maps_page/google_maps_page.dart';

import 'package:hci_m3_app/home_page/home_page.dart';
import 'package:hci_m3_app/info_page/info_page.dart';
import 'package:hci_m3_app/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

// when a BottomNavigationBarItem is taped _currentIndex is set
//to the respective index and the body is updated to the corresponding screen
class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  var _screens = [HomePage(), GoogleMapsPage(), InfoPage(), SettingsPage()];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    final primaryColor =
        isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue;
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.25),
                  Colors.white.withOpacity(0.2),
                ],
                stops: [0.5, 1],
                begin: FractionalOffset(0.5, 0.2),
                end: FractionalOffset(0.6, 0.9),
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            children: _screens,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        elevation: 8.0,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.4),
        items: bottomNavigationItems,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
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
    icon: Icon(Icons.home_rounded),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map_rounded),
    label: "Maps",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_rounded),
    label: "Info",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "Einstellungen",
  )
];
